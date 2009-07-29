class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create_intern, :create_extern]
  before_filter :require_user, :except => [:new, :create_intern, :create_extern]
	
  def index
		@users = current_user.department.users
	end
	
  def new
    @intern = User.new
		@extern = User.new
		render :layout => "centered"
  end
	
	# Generate login and password and send them via mail to the user. The account is disabled by default.
  def create_extern
		@extern = User.new(params[:user])
		@extern.password_confirmation = @extern.password
		@intern = User.new
		@extern.login = @extern.email
		@extern.password = Base64.encode64(Digest::SHA1.digest("#{rand(1<<64)}/#{Time.now.to_f}/#{Process.pid}/#{@extern.login}"))[0..7]
		@extern.password_confirmation = @extern.password
		@extern.active = false

		if @extern.save
      flash[:success] = "Account registered! Your password has been sent to your mailbox."
			Notifier.deliver_welcome_email(@extern, @extern.password)
      redirect_to register_path
    else
      render :action => :new
    end
	end

	# LDAP authentication and data import for members of the university.
	def create_intern
		@intern = User.new(params[:user])
		@intern.active = true
		@extern = User.new
		@intern.password_confirmation = @intern.password
		if(!@intern.department.nil?)
			dep = @intern.department.ldap_ou
			dc = @intern.department.organization.ldap_dc
			base_dn = "ou=People,#{dep},#{dc}"
			dn = "uid="+@intern.login
			@intern.ldap_dn = "#{dn},#{base_dn}"
			data = LDAP.register @intern.login, @intern.password, base_dn
			@intern.email = data.first.mail.first
			@intern.private_email = data.first.mailprivat.first rescue nil
			@intern.surname = data.first.sn.first rescue nil
			@intern.name = data.first.givenname.first rescue nil
			if data.first.edupersonaffiliation.first == "student"
				@intern.semester = data.first.hfucurrentsemester.first
				@intern.course = Course.find(:first, :conditions => ["short like ?", data.first.hfustudycourse.first])
				@intern.regid = data.first.hfuregid.first
				@intern.roles << Role.find(:first, :conditions => ["title like 'Student'"])
			elsif data.first.edupersonaffiliation.first == "employee"
				@intern.roles << Role.find(:first, :conditions => ["title like 'Employee'"])
			elsif data.first.edupersonaffiliation.first == "staff"
				@intern.roles << Role.find(:first, :conditions => ["title like 'Employee'"])
			elsif data.first.edupersonaffiliation.first == "faculty"
				@intern.roles << Role.find(:first, :conditions => ["title like 'Professor'"])
				@intern.title = data.first.hfutitle.first
			else
				@intern.active = false
			end
		end
		
    if @intern.save
      flash[:success] = "Welcome to insight!"
      redirect_back_or_default account_url
    else
      render :action => :new
    end
  end
  
  def show
		@user = User.find(params[:id]) rescue current_user
  end
 
  def edit
    @user = current_user
  end
  
  def update
    @user = @current_user
    if @user.update_attributes(params[:user])
      flash[:success] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
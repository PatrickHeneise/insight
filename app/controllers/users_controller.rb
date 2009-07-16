class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new]
  before_filter :require_user, :only => [:show, :edit, :update]
  
  def index
		@users = User.find(:all)
	end
	
  def new
    @intern = User.new
		@extern = User.new
  end
	
  def create_extern
		@extern = User.new(params[:user])
		@extern.password_confirmation = @extern.password
		@intern = User.new
		
		prop_login = @extern.name + @extern.surname
		prop_login.downcase!
		prop = false
		prop_count = 1
		while(prop == false)
			check = User.find(:first, :conditions => ['login like ?', prop_login])
			if(check.nil?)
				prop = true
			else
				prop_login = @extern.name + @extern.surname + prop_count.to_s
				prop_login.downcase!
				prop_count += 1
			end
		end
		@extern.login = prop_login
		@extern.password = Base64.encode64(Digest::SHA1.digest("#{rand(1<<64)}/#{Time.now.to_f}/#{Process.pid}/#{@extern.login}"))[0..7]
		@extern.password_confirmation = @extern.password
		@extern.active = false

		if @extern.save
      flash[:notice] = "Account registered!"
      redirect_back_or_default account_url
    else
      render :action => :new
    end
	end
	
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
			logger.debug base_dn
			logger.debug @intern.password
			logger.debug @intern.login
			logger.debug data.to_yaml
			@intern.email = data.first.mail.first
			@intern.private_email = data.first.mailprivat.first
			@intern.surname = data.first.sn.first
			@intern.name = data.first.givenname.first
			logger.debug data.first.edupersonaffiliation
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
      flash[:notice] = "Account registered!"
      redirect_back_or_default account_url
    else
      render :action => :new
    end
  end
  
  def show
		@user = User.find(params[:id]) rescue current_user
  end
 
  def edit
    @user = @current_user
  end
  
  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
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
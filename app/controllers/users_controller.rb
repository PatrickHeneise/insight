class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new]
  before_filter :require_user, :only => [:show, :edit, :update]
  
  def index
		@users = User.find(:all)
	end
	
  def new
    @user = User.new
  end
  
	def new_member
    @user = User.new
  end
	
	def new_guest
    @user = User.new
  end
	
  def create
    @user = User.new(params[:user])
		@user.password_confirmation = @user.password
		
		if(@user.login.nil?)
			prop_login = @user.name + @user.surname
			prop_login.downcase!
			prop = false
			prop_count = 1
			while(prop == false)
				check = User.find(:first, :conditions => ['login like ?', prop_login])
				if(check.nil?)
					prop = true
				else
					prop_login = @user.name + @user.surname + prop_count.to_s
					prop_login.downcase!
					prop_count += 1
				end
			end
			@user.login = prop_login
			@user.password = Base64.encode64(Digest::SHA1.digest("#{rand(1<<64)}/#{Time.now.to_f}/#{Process.pid}/#{@user.login}"))[0..7]
			@user.password_confirmation = @user.password
			@user.active = false
		else
			if(!@user.department.nil?)
			dep = @user.department.ldap_ou
			dc = @user.department.organization.ldap_dc
			dn = "uid="+@user.login+"ou=People,"+dep+","+dc
			end
		end
		
    if @user.save
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
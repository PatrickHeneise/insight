class Admin::UsersController < ApplicationController
	layout "admin"
	
  def index
		@users = User.find(:all)
	end
	
  def show
		@user = User.find(params[:id])
  end
 
  def edit
    @user = User.find(params[:id])
  end
	
  def update
    @user = User.find(params[:user])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to admin_users_path
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

	def activate
		@user = User.find(params[:id])
		@user.active = true
		if @user.save
			flash[:notice] = "User activated"
			redirect_to admin_users_path
		end
	end
	
	def deactivate
		@user = User.find(params[:id])
		@user.active = false
		if @user.save
			flash[:notice] = "User deactivated"
			redirect_to admin_users_path
		end
	end
end

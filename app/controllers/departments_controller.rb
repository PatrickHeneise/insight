class DepartmentsController < ApplicationController
	current_tab :blog
	
  # GET /departments
  def index
    @departments = Department.all
  end

  # GET /departments/1
  def show
    @department = Department.find(params[:id])
  end
	
	def users
		@users = Department.find(params[:id]).users
	end
end

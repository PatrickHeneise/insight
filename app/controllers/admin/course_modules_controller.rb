class Admin::CourseModulesController < ApplicationController
	before_filter :load_course
	layout "admin"
	filter_access_to :all
  filter_access_to :edit, :update, :attribute_check => true
	
  # GET /course_modules
  def index
    @course_modules = CourseModule.all
  end

  # GET /course_modules/new
  def new
    @course_module = CourseModule.new
  end

  # GET /course_modules/1/edit
  def edit
    @course_module = CourseModule.find(params[:id])
  end

  # POST /course_modules
  def create
    @course_module = CourseModule.new(params[:course_module])
		@course_module.course = @course

    respond_to do |format|
      if @course_module.save
        flash[:success] = 'CourseModule was successfully created.'
        format.html { redirect_to(admin_course_path(@course)) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /course_modules/1
  def update
    @course_module = CourseModule.find(params[:id])

    respond_to do |format|
      if @course_module.update_attributes(params[:course_module])
        flash[:success] = 'CourseModule was successfully updated.'
        format.html { redirect_to(admin_course_path(@course)) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /course_modules/1
  def destroy
    @course_module = CourseModule.find(params[:id])
    @course_module.destroy

    respond_to do |format|
      format.html { redirect_to(course_modules_url) }
      format.xml  { head :ok }
    end
  end
	
	private
		def load_course
			@course = Course.find(params[:course_id])
		end
end
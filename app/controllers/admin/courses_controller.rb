class Admin::CoursesController < ApplicationController
	layout "admin"
	# GET /courses
  # GET /courses.xml
  def index
    @courses = Course.all
  end
	
  # GET /courses/1
  def show
    @course = Course.find(params[:id])
		@course_modules = CourseModule.find(:all, :conditions => {:course_id => @course}, :order => "level")
  end
	
  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  def create
    @course = Course.new(params[:course])

    respond_to do |format|
      if @course.save
        flash[:success] = 'Course was successfully created.'
        format.html { redirect_to(@course) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /courses/1
  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        flash[:success] = 'Course was successfully updated.'
        format.html { redirect_to(@course) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /courses/1
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to(courses_url) }
    end
  end
end

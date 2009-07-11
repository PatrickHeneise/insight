class Admin::CourseModulesController < ApplicationController
  # GET /course_modules
  # GET /course_modules.xml
  def index
    @course_modules = CourseModule.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @course_modules }
    end
  end

  # GET /course_modules/new
  # GET /course_modules/new.xml
  def new
    @course_module = CourseModule.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @course_module }
    end
  end

  # GET /course_modules/1/edit
  def edit
    @course_module = CourseModule.find(params[:id])
  end

  # POST /course_modules
  # POST /course_modules.xml
  def create
    @course_module = CourseModule.new(params[:course_module])

    respond_to do |format|
      if @course_module.save
        flash[:notice] = 'CourseModule was successfully created.'
        format.html { redirect_to(@course_module) }
        format.xml  { render :xml => @course_module, :status => :created, :location => @course_module }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @course_module.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /course_modules/1
  # PUT /course_modules/1.xml
  def update
    @course_module = CourseModule.find(params[:id])

    respond_to do |format|
      if @course_module.update_attributes(params[:course_module])
        flash[:notice] = 'CourseModule was successfully updated.'
        format.html { redirect_to(@course_module) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @course_module.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /course_modules/1
  # DELETE /course_modules/1.xml
  def destroy
    @course_module = CourseModule.find(params[:id])
    @course_module.destroy

    respond_to do |format|
      format.html { redirect_to(course_modules_url) }
      format.xml  { head :ok }
    end
  end
end
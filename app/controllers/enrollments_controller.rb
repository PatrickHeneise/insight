class EnrollmentsController < ApplicationController
  # GET /enrollment
  # GET /enrollment.xml
  def index
    @enrollments = current_user.enrollments

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @enrollment }
    end
  end

  # GET /enrollment/1
  # GET /enrollment/1.xml
  def show
    @enrollment = Enrollment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @enrollment }
    end
  end

  # GET /enrollment/new
  # GET /enrollment/new.xml
  def new
    @enrollment = Enrollment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @enrollment }
    end
  end

  # GET /enrollment/1/edit
  def edit
    @enrollment = Enrollment.find(params[:id])
  end

  # POST /enrollment
  # POST /enrollment.xml
  def create
    @enrollment = Enrollment.new(params[:enrollment])

    respond_to do |format|
      if @enrollment.save
        flash[:notice] = 'Enrollment was successfully created.'
        format.html { redirect_to(department_lecture_path(@enrollment.lecture.department, @enrollment.lecture)) }
        format.xml  { render :xml => @enrollment, :status => :created, :location => @enrollment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @enrollment.errors, :status => :unprocessable_entity }
      end
    end
  end
	
	def enrol
    @enrollment = Enrollment.new
		@enrollment.lecture = Lecture.find(params[:lecture_id])
		@enrollment.user = current_user

    respond_to do |format|
      if @enrollment.save
        flash[:notice] = 'Enrolled!'
        format.html { redirect_to(department_lecture_path(@enrollment.lecture.department, @enrollment.lecture)) }
	      format.xml  { render :xml => @enrollment.errors, :status => :unprocessable_entity }
			end
    end
  end

  def unrol
		@enrollment = current_user.enrollments.find_by_lecture_id params[:lecture_id]
    @enrollment.destroy

    respond_to do |format|
      format.html { redirect_to(department_lecture_path(@enrollment.lecture.department, @enrollment.lecture)) }
      format.xml  { head :ok }
    end
  end

  # PUT /enrollment/1
  # PUT /enrollment/1.xml
  def update
    @enrollment = Enrollment.find(params[:id])

    respond_to do |format|
      if @enrollment.update_attributes(params[:enrollment])
        flash[:notice] = 'Enrollment was successfully updated.'
        format.html { redirect_to(@enrollment) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @enrollment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /enrollment/1
  # DELETE /enrollment/1.xml
  def destroy
    @enrollment = Enrollment.find(params[:id])
    @enrollment.destroy

    respond_to do |format|
      format.html { redirect_to(enrollment_url) }
      format.xml  { head :ok }
    end
  end
end

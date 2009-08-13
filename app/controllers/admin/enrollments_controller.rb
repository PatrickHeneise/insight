class Admin::EnrollmentsController < ApplicationController
	layout "admin"
	before_filter :load_lecture
	filter_access_to :all
  filter_access_to :edit, :update, :attribute_check => true

  # GET /enrollment
  def index
    @enrollment = Enrollment.all
  end

  # GET /enrollment/1
  def show
    @enrollment = Enrollment.find(params[:id])
  end

  # GET /enrollment/new
  def new
    @enrollment = Enrollment.new
  end

  # GET /enrollment/1/edit
  def edit
    @enrollment = Enrollment.find(params[:id])
  end

  # POST /enrollment
  def create
    @enrollment = Enrollment.new(params[:enrollment])

    respond_to do |format|
      if @enrollment.save
        flash[:success] = 'Enrollment was successfully created.'
        format.html { redirect_to(@enrollment) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /enrollment/1
  def update
    @enrollment = Enrollment.find(params[:id])

    respond_to do |format|
      if @enrollment.update_attributes(params[:enrollment])
        flash[:success] = 'Enrollment was successfully updated.'
        format.html { redirect_to(@enrollment) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /enrollment/1
  def destroy
    @enrollment = Enrollment.find(params[:id])
    @enrollment.destroy

    respond_to do |format|
      format.html { redirect_to(enrollment_url) }
    end
  end
	
	private
		def load_lecture
			@lecture = Lecture.find(params[:lecture_id])
		end
end
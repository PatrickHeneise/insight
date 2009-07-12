class LecturesController < ApplicationController
	before_filter :load_department
	
  # GET /lectures/1
  # GET /lectures/1.xml
  def show
    @lecture = Lecture.find(params[:id])
		@page = params[:page].to_i
    @bullets = @lecture.board.bullets.paginate :page => @page, :order => 'created_at DESC', :per_page => 10
    respond_to do |format|
      format.html
      format.js do
        render :update do |page|
          page.replace_html 'bullets', :partial => "boards/show"
        end
      end
    end
	end
	
	protected
		def load_department
			@department = Department.find(params[:department_id])
		end
		
		def enrol
			@enrollment = Enrollment.new
			@enrollment.lecture = Lecture.find(params[:id])
			@enrollment.user = current_user
			if @enrollment.save
				flash[:notice] = 'Booked.'
				redirect_to(overview_path)
			else
				flash[:error] = @enrollment.errors
				redirect_to(overview_path)
			end
		end
		
		def unrol
			@enrollment = current_user.enrollments.find_by_lecture_id params[:id]
			@enrollment.destroy
			flash[:notice] = 'Canceled.'
			redirect_to(overview_path)
		end
end

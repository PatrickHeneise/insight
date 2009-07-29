class LecturesController < ApplicationController
	current_tab :lectures

	before_filter :load_department
	
  # GET /lectures
  def index
    @lectures = Lecture.all
  end

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
end

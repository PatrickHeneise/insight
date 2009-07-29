class FoldersController < ApplicationController
	current_tab :lecture
	before_filter :load_vars
	
	def load_vars
		@department = Department.find(params[:department_id])
		@lecture = Lecture.find(params[:lecture_id])
	end
	
  # GET /folders/1
  # GET /folders/1.xml
  def show
    @folder = Folder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @folder }
    end
  end
end

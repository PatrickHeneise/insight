class Admin::LecturesController < ApplicationController
	layout "admin"
	filter_access_to :all
  filter_access_to :edit, :update, :attribute_check => true

  # GET /lectures
  def index
    @lectures = Lecture.all
  end
	
  # GET /lectures/new
  def new
    @lecture = Lecture.new
		@lecture.events.build
		@lecture.events.first.is_blocked = false
		@course_module = CourseModule.new
  end

  # GET /lectures/1/edit
  def edit
    @lecture = Lecture.find(params[:id])
  end

  # POST /lectures
  def create
    @lecture = Lecture.new(params[:lecture])
		@board = Board.new
		@folder = Folder.new
		@board.lecture = @lecture
		@folder.name = @lecture.title
		@folder.lecture = @lecture

    respond_to do |format|
      if @lecture.save
				@folder.save
				@board.save
        flash[:success] = 'Lecture was successfully created.'
        format.html { redirect_to(department_lecture_path(@lecture.department, @lecture)) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /lectures/1
  def update
    @lecture = Lecture.find(params[:id])

    respond_to do |format|
      if @lecture.update_attributes(params[:lecture])
				@lecture.events.each do |e|
					if(e.is_blocked = true)
						e.to_date = nil
						e.to_time = nil
						e.at_time = nil
					else
						e.from_block = nil
						e.to_block = nil
						e.repeatInterval = nil
						e.repeatFrequency = nil
					end
					e.save
				end
        flash[:success] = 'Lecture was successfully updated.'
        format.html { redirect_to(department_lecture_path(@lecture.department, @lecture)) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /lectures/1
  def destroy
    @lecture = Lecture.find(params[:id])
    @lecture.destroy

    respond_to do |format|
      format.html { redirect_to(admin_lectures_path) }
    end
  end
end

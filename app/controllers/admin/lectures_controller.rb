class Admin::LecturesController < ApplicationController
  # GET /lectures
  # GET /lectures.xml
  def index
    @lectures = Lecture.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lectures }
    end
  end
	
  # GET /lectures/new
  # GET /lectures/new.xml
  def new
    @lecture = Lecture.new
		@lecture.events.build
		@lecture.events.first.is_blocked = false
		@course_module = CourseModule.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lecture }
    end
  end

  # GET /lectures/1/edit
  def edit
    @lecture = Lecture.find(params[:id])
  end

  # POST /lectures
  # POST /lectures.xml
  def create
    @lecture = Lecture.new(params[:lecture])
		@lecture.user = User.find(params[:lecture][:user_id])
		@lecture.department = @lecture.user.department
		@board = Board.new
		@folder = Folder.new
		@board.lecture = @lecture
		@folder.name = @lecture.title
		@folder.lecture = @lecture
		@folder.save
		@board.save

    respond_to do |format|
      if @lecture.save
        flash[:notice] = 'Lecture was successfully created.'
        format.html { redirect_to(department_lecture_path(@lecture.department, @lecture)) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /lectures/1
  # PUT /lectures/1.xml
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
        flash[:notice] = 'Lecture was successfully updated.'
        format.html { redirect_to(department_lecture_path(@lecture.department, @lecture)) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /lectures/1
  # DELETE /lectures/1.xml
  def destroy
    @lecture = Lecture.find(params[:id])
    @lecture.destroy

    respond_to do |format|
      format.html { redirect_to(admin_lectures_path) }
    end
  end
end

class Admin::FoldersController < ApplicationController
	# GET /folders/new
  # GET /folders/new.xml
  def new
    @folder = Folder.new
		@folder.parent = Folder.find(params[:parent])

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /folders/1/edit
  def edit
    @folder = Folder.find(params[:id])
  end

  # POST /folders
  # POST /folders.xml
  def create
    @folder = Folder.new(params[:folder])

    respond_to do |format|
      if @folder.save
        flash[:notice] = 'Folder was successfully created.'
        format.html { redirect_to(department_lecture_folder_path(@folder.parent.lecture.department, @folder.parent.lecture, @folder)) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /folders/1
  # PUT /folders/1.xml
  def update
    @folder = Folder.find(params[:id])

    respond_to do |format|
      if @folder.update_attributes(params[:folder])
        flash[:notice] = 'Folder was successfully updated.'
        format.html { redirect_to(department_lecture_folder_path(@folder.lecture.department, @folder.lecture, @folder)) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /folders/1
  # DELETE /folders/1.xml
  def destroy
    @folder = Folder.find(params[:id])
    @folder.destroy

    respond_to do |format|
      format.html { redirect_to(department_lecture_path(@folder.lecture.department, @folder.lecture)) }
    end
  end
end

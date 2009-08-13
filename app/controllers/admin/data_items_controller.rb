class Admin::DataItemsController < ApplicationController
	before_filter :load_folder
	filter_access_to :all
  filter_access_to :edit, :update, :attribute_check => true

  # GET /data_items/new
  def new
    @data_item = DataItem.new
  end

  # POST /data_items
  def create
    @data_item = DataItem.new(params[:data_item])
		@data_item.folder = Folder.find(params[:folder_id])
		@data_item.user = current_user

    respond_to do |format|
      if @data_item.save
        flash[:success] = 'DataItem was successfully created.'
        format.html { redirect_to(department_lecture_folder_path(@folder.lecture.department, @folder.lecture, @folder)) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # DELETE /data_items/1
  def destroy
    @data_item = DataItem.find(params[:id])
    @data_item.destroy

    respond_to do |format|
      format.html { redirect_to(department_lecture_folder_path(@folder.lecture.department, @folder.lecture, @folder)) }
    end
  end
	
	protected
		def load_folder
			@folder = Folder.find(params[:folder_id])
		end
end
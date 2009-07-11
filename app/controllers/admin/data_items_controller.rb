class Admin::DataItemsController < ApplicationController
	before_filter :load_folder
	
	def load_folder
		@folder = Folder.find(params[:folder_id])
	end

  # GET /data_items/new
  # GET /data_items/new.xml
  def new
    @data_item = DataItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @data_item }
    end
  end

  # POST /data_items
  # POST /data_items.xml
  def create
    @data_item = DataItem.new(params[:data_item])
		@data_item.folder = Folder.find(params[:folder_id])
		@data_item.user = current_user

    respond_to do |format|
      if @data_item.save
        flash[:notice] = 'DataItem was successfully created.'
        format.html { redirect_to(@folder) }
        format.xml  { render :xml => @data_item, :status => :created, :location => @data_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @data_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /data_items/1
  # DELETE /data_items/1.xml
  def destroy
    @data_item = DataItem.find(params[:id])
    @data_item.destroy

    respond_to do |format|
      format.html { redirect_to(department_lecture_folder_path(@folder.lecture.department, @folder.lecture, @folder)) }
      format.xml  { head :ok }
    end
  end
end
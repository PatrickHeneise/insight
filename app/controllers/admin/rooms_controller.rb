class Admin::RoomsController < ApplicationController
	layout "admin"
	before_filter :load_building
	
	def load_building
		@building = Building.find(params[:building_id])
	end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
    @room = Room.find(params[:id])
  end

  # POST /rooms
  def create
    @room = Room.new(params[:room])
		@room.building = @building

    respond_to do |format|
      if @room.save
        flash[:notice] = 'Room was successfully created.'
        format.html { redirect_to(building_path(@building)) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /rooms/1
  def update
    @room = Room.find(params[:id])

    respond_to do |format|
      if @room.update_attributes(params[:room])
        flash[:notice] = 'Room was successfully updated.'
        format.html { redirect_to(building_path(@building)) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /rooms/1
  def destroy
    @room = Room.find(params[:id])
    @room.destroy

    respond_to do |format|
      format.html { redirect_to(building_path(@building)) }
    end
  end
end
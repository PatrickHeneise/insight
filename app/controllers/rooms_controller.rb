class RoomsController < ApplicationController
	before_filter :load_building
	
	def load_building
		@building = Building.find(params[:building_id])
	end
	
  # GET /rooms/1
  # GET /rooms/1.xml
  def show
    @room = Room.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end
end

class Admin::BuildingsController < ApplicationController
	layout "admin"

	# GET /buildings/new
  def new
    @building = Building.new
		@address = Address.new
  end

  # GET /buildings/1/edit
  def edit
    @building = Building.find(params[:id])
		@address = @building.address
  end

  # POST /buildings
  def create
    @building = Building.new(params[:building])
		if @building.address.nil?
			@address = Address.new(params[:address])
			@building.address = @address
		end

    respond_to do |format|
      if @building.save
				if !@address.nil?
					@address.save
				end
        flash[:notice] = 'Building was successfully created.'
        format.html { redirect_to(@building) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /buildings/1
  def update
    @building = Building.find(params[:id])

    respond_to do |format|
      if @building.update_attributes(params[:building])
        flash[:notice] = 'Building was successfully updated.'
        format.html { redirect_to(@building) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /buildings/1
  def destroy
    @building = Building.find(params[:id])
    @building.destroy

    respond_to do |format|
      format.html { redirect_to(buildings_url) }
    end
  end
end
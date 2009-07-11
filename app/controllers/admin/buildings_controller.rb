class Admin::BuildingsController < ApplicationController
	# GET /buildings/new
  # GET /buildings/new.xml
  def new
    @building = Building.new
		@address = Address.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @building }
    end
  end

  # GET /buildings/1/edit
  def edit
    @building = Building.find(params[:id])
		@address = @building.address
  end

  # POST /buildings
  # POST /buildings.xml
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
        format.xml  { render :xml => @building, :status => :created, :location => @building }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @building.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /buildings/1
  # PUT /buildings/1.xml
  def update
    @building = Building.find(params[:id])

    respond_to do |format|
      if @building.update_attributes(params[:building])
        flash[:notice] = 'Building was successfully updated.'
        format.html { redirect_to(@building) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @building.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /buildings/1
  # DELETE /buildings/1.xml
  def destroy
    @building = Building.find(params[:id])
    @building.destroy

    respond_to do |format|
      format.html { redirect_to(buildings_url) }
      format.xml  { head :ok }
    end
  end
end

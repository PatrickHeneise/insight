class Admin::EventsController < ApplicationController
	layout "admin"
	
  # GET /events/new
  def new
    @event = Event.new
	end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  def create
    @event = Event.new(params[:event])
		@event.at_date = Date.strptime(params[:event][:at_date], '%d.%m.%Y') if params[:event][:at_date] != ""
		@event.to_date = Date.strptime(params[:event][:to_date], '%d.%m.%Y') if params[:event][:to_date] != ""

    respond_to do |format|
      if @event.save
        flash[:success] = 'Event was successfully created.'
        format.html { redirect_to(@event) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /events/1
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        flash[:success] = 'Event was successfully updated.'
        format.html { redirect_to(@event) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /events/1
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
    end
  end
end

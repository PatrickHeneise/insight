class EventsController < ApplicationController
	current_tab :calendar
  # GET /events
  # GET /events.xml
  def index
		@year = @params[:year].to_i rescue Date.today.year
		@month = @params[:month].to_i rescue Date.today.month
		@events = Event.events
		
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end
end

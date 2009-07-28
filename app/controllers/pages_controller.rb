class PagesController < ApplicationController
	require 'yahoo-weather'
	
  def index
		@enrollments = current_user.enrollments
		@subscriptions = current_user.subscriptions

    @client = YahooWeather::Client.new
    @response = @client.lookup_location 'GMXX3599', 'c'

  end
	
	def calendar
		
	end
end

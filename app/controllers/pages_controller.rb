class PagesController < ApplicationController
	require 'yahoo-weather'
	require 'flickr_fu'
	layout 'fullwidth'

  def index
		@enrollments = current_user.enrollments
		@subscriptions = current_user.subscriptions

    @client = YahooWeather::Client.new
    @response = @client.lookup_location 'GMXX3599', 'c'
		flickr = Flickr.new(File.join(RAILS_ROOT, 'config', 'flickr.yml'))
		@photos = flickr.photos.search(:group_id => '1120755@N25', :media => "photos", :sort => "date-posted-desc", :per_page => 6, :page => 1)
  end
end

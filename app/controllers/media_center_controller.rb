class MediaCenterController < ApplicationController
	require 'youtube_g'
	require 'flickr_fu'
	
  def index
		flickr = Flickr.new(File.join(RAILS_ROOT, 'config', 'flickr.yml'))
		youtube = YouTubeG::Client.new
		
		@photos = flickr.photos.search(:group_id => '1120755@N25', :media => "photos", :sort => "date-posted-asc").paginate(:page => params[:page], :per_page => 9)
		@videos = youtube.videos_by(:query => "furtwangen", :max_results => 3).videos
  end

end

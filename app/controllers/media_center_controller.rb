class MediaCenterController < ApplicationController
	require 'youtube_g'
	
  def index
		flickr = Flickr.new('config/flickr.yml')
		youtube = YouTubeG::Client.new
		
		@videos = youtube.videos_by(:query => "furtwangen", :max_results => 3).videos
 
		
		@page = params[:page]
		if @page.nil?
			@page = 1
		end
		if @page.to_i <= 1
			@page = 1
		end
		@photos = flickr.photos.search(:group_id => '1120755@N25', 'per_page' => 9, 'page' => @page)
  end

end

class PagesController < ApplicationController
	require 'yahoo-weather'
	require 'flickr_fu'
	require 'rss/2.0'
	require 'open-uri'
	layout 'fullwidth'

  def index
		@enrollments = current_user.enrollments
		@subscriptions = current_user.subscriptions

    @client = YahooWeather::Client.new
    @response = @client.lookup_location 'GMXX3599', 'c'
		flickr = Flickr.new(File.join(RAILS_ROOT, 'config', 'flickr.yml'))
		@photos = flickr.photos.search(:group_id => '1120755@N25', :media => "photos", :sort => "date-posted-desc", :per_page => 6, :page => 1)
		mensa_url = 'http://www.studentenwerk.uni-freiburg.de/rss/641/'
		@mensa = ''
		open(mensa_url) do |http|
			response = http.read
      result = RSS::Parser.parse(response, false)
      result.items[0..1].each_with_index do |item, index|
				menu = 1
				title = Sanitize.clean(item.title, Sanitize::Config::RESTRICTED)
				desc = Sanitize.clean(item.description, Sanitize::Config::RESTRICTED)
				#strip <u> tags out of the feed
				desc.gsub!("<u>","")
				desc.gsub!("</u>","")
				# replace Menü with proper h4 header and div wraps
				desc.gsub!(/Menü [0-9]*/,"</div><div class=\"mensa_desc span-6 last\"><strong>Men&uuml;</strong> ")
				# remove first </div>
				desc = desc.slice(6..-1)
				# remove 'last'-class from the first menu container and put everything together
				first = desc
				second = desc
				first = first.slice(0..28)
				second = second.slice(34..-1)
				desc = first << second
				link = Sanitize.clean(item.link, Sanitize::Config::RESTRICTED)
				@mensa += "<div class=\"mensa_day span-12\"><a href=\"#{link}\" alt=\"mensa menu\"><h4>#{title}</h4></a>#{desc}</div></div>"
      end  
		end
  end
	
  # GET /pages/1
  # GET /pages/1.xml
  def show
    @page = Page.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @jobs }
    end
  end
	
	def static
		@page = Page.find(:first, :conditions => ["title like ?", params[:title]] )
		render :action => 'show'
	end
end

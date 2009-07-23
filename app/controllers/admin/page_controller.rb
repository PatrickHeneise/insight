class Admin::PageController < ApplicationController
	layout "admin"
	
	def index
		@lectures = Lecture.find(:all, :order => 'updated_at DESC', :limit => 5)
	end
end

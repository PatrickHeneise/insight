class Admin::PagesController < ApplicationController
	layout "admin"
	
	def index
		@inactive = User.inactive
	end
end

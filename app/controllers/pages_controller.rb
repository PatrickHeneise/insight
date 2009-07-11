class PagesController < ApplicationController
	current_tab :home
	
  def index
		@enrollments = current_user.enrollments
		@subscriptions = current_user.subscriptions
  end
	
	def calendar
		
	end
end

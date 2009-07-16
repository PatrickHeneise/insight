class ApplicationController < ActionController::Base
	before_filter :require_user
	
  helper :all # include all helpers, all the time
	helper_method :current_user_session, :current_user
	
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
	filter_parameter_logging :password, :password_confirmation, :api_key, :api_secret

	layout "hfu", :except => [ :rss, :atom, :authorization_rules ]
	
	def permission_denied 
		respond_to do |format| 
			format.html do 
				flash[:error] = "YOU SHALL NOT PASS!" 
				redirect_to root_url and return 
			end 
			format.xml { render :text => "Not Authorized", :status => :forbidden }
		end 
	end
	
	def update_last_seen_at
		User.update_all ['last_seen_at = ?', Time.now], ['id = ?', current_user.id] 
		current_user.last_seen_at = Time.now
  end
	
	def numeric?(object)
		true if Float(object) rescue false
	end
	
	private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end
    
    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end
    
    def require_user
      unless current_user
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_user_session_url
        return false
      end
    end

    def require_no_user
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to account_url
        return false
      end
    end
    
    def store_location
      session[:return_to] = request.request_uri
    end
    
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
end

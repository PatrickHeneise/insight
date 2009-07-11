module ControllerSpecHelper
  def login_user(username)
    session[:casfilteruser] = username
  end

  def logout
    session[:casfilteruser] = nil
  end

  def get_page(action, options = {})
    get action, options
    response.should be_success
  end  
end
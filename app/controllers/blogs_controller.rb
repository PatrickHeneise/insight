class BlogsController < ApplicationController	
  # GET /blogs/1
  # GET /blogs/1.xml
  def show
    @articles = current_user.department.blog.articles

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @blog }
    end
  end
end

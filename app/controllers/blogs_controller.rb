class BlogsController < ApplicationController	
  # GET /blogs/1
  # GET /blogs/1.xml
  def show
    @articles = current_user.department.blog.articles.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 10

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @blog }
    end
  end
end

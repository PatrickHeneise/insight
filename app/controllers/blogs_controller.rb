class BlogsController < ApplicationController
	current_tab :blog
	
  # GET /blogs/1
  # GET /blogs/1.xml
  def show
		@blog = current_user.department.blog
    @articles = @blog.articles.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 10

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @blog }
    end
  end
end

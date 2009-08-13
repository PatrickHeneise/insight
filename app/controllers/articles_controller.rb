class ArticlesController < ApplicationController
	before_filter :load_blog
	current_tab :blogs
	
  # GET /articles/1
  # GET /articles/1.xml
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
    end
  end
	
	private
		def load_blog
			@blog = Blog.find(params[:blog_id])
		end
end

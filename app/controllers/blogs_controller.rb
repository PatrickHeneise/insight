class BlogsController < ApplicationController
	current_tab :blogs
	
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
	
	def index
		@blog = current_user.department.blog
    @articles = @blog.articles.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 10
		render :action => 'show'
	end
	
	def show_date
		@blog = current_user.department.blog
		if params[:day].nil?
			d = "#{params[:year]}-#{params[:month]}%"
		elsif params[:month].nil?
			d = "#{params[:year]}%"
		else
			d = "#{params[:year]}-#{params[:month]}-#{params[:day]}%"
		end
		@articles = Article.find(:all, :conditions => [ "updated_at LIKE ?", d ])
		render :action => 'show'
	end
end

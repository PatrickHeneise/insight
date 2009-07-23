class Admin::ArticlesController < ApplicationController
	layout "admin"
	before_filter :load_blog
	
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        flash[:notice] = 'Article was successfully created.'
        format.html { redirect_to(@article) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /articles/1
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        flash[:notice] = 'Article was successfully updated.'
        format.html { redirect_to(@article) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /articles/1
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(articles_url) }
    end
  end
	
	private
		def load_blog
			@blog = Blog.find(params[:blog_id])
		end
end

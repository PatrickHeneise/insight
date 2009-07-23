class Admin::BlogsController < ApplicationController
	layout "admin"
	filter_access_to :new, :create, :require => :create
	filter_access_to :edit, :update, :require => :update
	filter_access_to :destroy, :require => :delete
	
	# GET /blogs
  def index
    @blogs = Blog.all
  end
	
	# GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
    @blog = Blog.find(params[:id])
  end

  # POST /blogs
  def create
    @blog = Blog.new(params[:blog])

    respond_to do |format|
      if @blog.save
        flash[:notice] = 'Blog was successfully created.'
        format.html { redirect_to(@blog) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /blogs/1
  def update
    @blog = Blog.find(params[:id])

    respond_to do |format|
      if @blog.update_attributes(params[:blog])
        flash[:notice] = 'Blog was successfully updated.'
        format.html { redirect_to(@blog) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /blogs/1
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to(blogs_url) }
    end
  end
end

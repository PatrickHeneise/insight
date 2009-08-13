class Admin::ForumsController < ApplicationController
	layout "admin"
	filter_access_to :all
  filter_access_to :edit, :update, :attribute_check => true

  # GET /forums/new
  def new
    @forum = Forum.new
  end

  # GET /forums/1/edit
  def edit
    @forum = Forum.find(params[:id])
  end

  # POST /forums
  def create
    @forum = Forum.new(params[:forum])

    respond_to do |format|
      if @forum.save
        flash[:success] = 'Forum was successfully created.'
        format.html { redirect_to(@forum) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /forums/1
  def update
    @forum = Forum.find(params[:id])

    respond_to do |format|
      if @forum.update_attributes(params[:forum])
        flash[:success] = 'Forum was successfully updated.'
        format.html { redirect_to(@forum) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /forums/1
  def destroy
    @forum = Forum.find(params[:id])
    @forum.destroy

    respond_to do |format|
      format.html { redirect_to(forums_url) }
    end
  end
end
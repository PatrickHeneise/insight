class BulletsController < ApplicationController
  require 'sanitize'
	before_filter :load_vars
	
	def load_vars
		@department = Department.find(params[:department_id])
		@lecture = Lecture.find(params[:lecture_id])
		@board = Board.find(params[:board_id])
	end

  # GET /bullets/1
  # GET /bullets/1.xml
  def show
		@page = params[:page].to_i
    @bullet = Bullet.find(params[:id])
		if (@page == 0)
			@replies = @bullet.replies.paginate :page => :last, :order => 'created_at ASC', :per_page => 10
		else
			@replies = @bullet.replies.paginate :page => @page, :order => 'created_at ASC', :per_page => 10
		end
		@activity = @bullet.get_state(current_user)
		if @activity.nil?
			@activity = BulletActivity.new
			@activity.user = current_user
			@activity.bullet = @bullet
			@activity.save
			@activity.mark_as_read
		end
		@bullet.save

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bullet }
    end
  end

  # GET /bullets/new
  # GET /bullets/new.xml
  def new
    @bullet = Bullet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bullet }
    end
  end

  # GET /bullets/1/edit
  def edit
    @bullet = Bullet.find(params[:id])
  end

  # POST /bullets
  # POST /bullets.xml
  def create
    @bullet = Bullet.new(params[:bullet])
		@bullet.user = current_user

    respond_to do |format|
      if @bullet.save
        flash[:notice] = 'Bullet was successfully created.'
        format.html { redirect_to(@bullet) }
        format.xml  { render :xml => @bullet, :status => :created, :location => @bullet }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bullet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bullets/1
  # PUT /bullets/1.xml
  def update
    @bullet = Bullet.find(params[:id])

    respond_to do |format|
      if @bullet.update_attributes(params[:bullet])
        flash[:notice] = 'Bullet was successfully updated.'
        format.html { redirect_to(@bullet) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bullet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bullets/1
  # DELETE /bullets/1.xml
  def destroy
    @bullet = Bullet.find(params[:id])
    @bullet.destroy

    respond_to do |format|
      format.html { redirect_to(bullets_url) }
      format.xml  { head :ok }
    end
  end
end

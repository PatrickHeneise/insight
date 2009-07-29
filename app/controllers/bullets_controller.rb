class BulletsController < ApplicationController
	current_tab :lectures
  require 'sanitize'
	before_filter :load_department_board_and_lecture
	
  # GET /bullets/1
  def show
		@page = params[:page].to_i
    @bullet = Bullet.find(params[:id])
		if (@page == 0)
			@replies = @bullet.replies.paginate :page => :last, :order => 'created_at ASC', :per_page => 10
		else
			@replies = @bullet.replies.paginate :page => @page, :order => 'created_at ASC', :per_page => 10
		end
		respond_to do |format|
      format.html do
				update_last_seen_at
				(session[:bullets] ||= {})[@bullet.id] = Time.now
			end
      format.js do
        render :update do |page|
          page.replace_html 'replies', :partial => "replies/list"
        end
      end
    end  end

  # GET /bullets/new
  def new
    @bullet = Bullet.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /bullets/1/edit
  def edit
    @bullet = Bullet.find(params[:id])
  end

  # POST /bullets
  def create
    @bullet = Bullet.new(params[:bullet])
		@bullet.board = @board
		@bullet.user = current_user

    respond_to do |format|
      if @bullet.save
        flash[:notice] = 'Bullet was successfully created.'
        format.html { redirect_to(department_lecture_board_bullet_path(@department, @lecture, @board, @bullet)) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /bullets/1
  def update
    @bullet = Bullet.find(params[:id])

    respond_to do |format|
      if @bullet.update_attributes(params[:bullet])
        flash[:notice] = 'Bullet was successfully updated.'
        format.html { redirect_to(department_lecture_board_bullet_path(@department, @lecture, @board, @bullet)) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /bullets/1
  def destroy
    @bullet = Bullet.find(params[:id])
    @bullet.destroy

    respond_to do |format|
      format.html { redirect_to(bullets_url) }
    end
  end
	
	protected
		def load_department_board_and_lecture
			@department = Department.find(params[:department_id])
			@lecture = Lecture.find(params[:lecture_id])
			@board = Board.find(params[:board_id])
		end
end

class RepliesController < ApplicationController
	before_filter :load_department_lecture_board_and_bullet

  # GET /replies/new
  def new
    @reply = Reply.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /replies/1/edit
  def edit
    @reply = Reply.find(params[:id])
  end

  # POST /replies
  def create
    @reply = Reply.new(params[:reply])
		@reply.user = current_user
		@reply.bullet = @bullet
		
    respond_to do |format|
      if @reply.save
        flash[:notice] = t(:'flash.notice.reply_created')
        format.html { redirect_to(department_lecture_board_bullet_path(@department, @lecture, @board, @bullet, :anchor => @reply)) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /replies/1
  def update
    @reply = Reply.find(params[:id])
		@reply.user = current_user
		@reply.bullet = @bullet

    respond_to do |format|
      if @reply.update_attributes(params[:reply])
        flash[:notice] = 'Reply was successfully updated.'
        format.html { redirect_to(department_lecture_board_bullet_path(@department, @lecture, @board, @bullet, :anchor => @reply)) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /replies/1
  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy

    respond_to do |format|
      format.html { redirect_to(replies_url) }
    end
  end

	protected
		def load_department_lecture_board_and_bullet
			@bullet = Bullet.find(params[:bullet_id])
			@board = Board.find(params[:board_id])
			@lecture = Lecture.find(params[:lecture_id])
			@department = Department.find(params[:department_id])
		end
end

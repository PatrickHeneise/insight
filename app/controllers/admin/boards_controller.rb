class Admin::BoardsController < ApplicationController
	layout "admin"
	filter_access_to :all
  filter_access_to :edit, :update, :attribute_check => true
	
  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/1/edit
  def edit
    @board = Board.find(params[:id])
  end

  # POST /boards
  def create
    @board = Board.new(params[:board])

    respond_to do |format|
      if @board.save
        flash[:success] = 'Board was successfully created.'
        format.html { redirect_to(@board) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /boards/1
  # PUT /boards/1.xml
  def update
    @board = Board.find(params[:id])

    respond_to do |format|
      if @board.update_attributes(params[:board])
        flash[:success] = 'Board was successfully updated.'
        format.html { redirect_to(@board) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /boards/1
  def destroy
    @board = Board.find(params[:id])
    @board.destroy

    respond_to do |format|
      format.html { redirect_to(boards_url) }
    end
  end
end

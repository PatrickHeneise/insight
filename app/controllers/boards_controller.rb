class BoardsController < ApplicationController
  # GET /boards/1
  # GET /boards/1.xml
  def show
    @board = Board.find(params[:id])
		@page = params[:page].to_i
    @bullets = @board.bullets.paginate :page => @page, :order => 'created_at DESC', :per_page => 10

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @board }
    end
  end
end

module BoardsHelper
  def recent_bullet_activity(bullet)
    return bullet.replied_at > ((session[:bullets] && session[:bullets][bullet.id]) || 3.days.ago) rescue return false
  end 
  
  def recent_board_activity(board)
		return board.recent_bullet.replied_at > ((session[:boards] && session[:boards][board.id]) || 3.days.ago) rescue return false
  end
end

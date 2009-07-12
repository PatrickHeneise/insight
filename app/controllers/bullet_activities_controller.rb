class BulletActivitiesController < ApplicationController
  def create
    @bullet_activity = BulletActivity.find_or_initialize_by_user_id_and_bullet_id(current_user.id, params[:bullet_id])
    @bullet_activity.update_attribute :active, true
    respond_to do |format| 
      format.html { redirect_to lecture_board_bullet_path(@bullet_activity.bullet.board.lecture, @bullet_activity.board, @bullet_activity.bullet }
      format.js
    end
  end
  
  def destroy
    BulletActivity.update_all ['active = ?', false], ['user_id = ? and bullet_id = ?', current_user.id, params[:bullet_id]]
    respond_to do |format| 
      format.html { lecture_board_bullet_path(@bullet_activity.bullet.board.lecture, @bullet_activity.board, @bullet_activity.bullet }
      format.js
    end
  end
end

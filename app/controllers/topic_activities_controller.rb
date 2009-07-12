class TopicActivitiesController < ApplicationController
  def create
    @topic_activity = TopicActivity.find_or_initialize_by_user_id_and_topic_id(current_user.id, params[:topic_id])
    @topic_activity.update_attribute :active, true
    respond_to do |format| 
      format.html { redirect_to topic_path(params[:forum_id], params[:topic_id]) }
      format.js
    end
  end
  
  def destroy
    TopicActivity.update_all ['active = ?', false], ['user_id = ? and topic_id = ?', current_user.id, params[:topic_id]]
    respond_to do |format| 
      format.html { redirect_to topic_path(params[:forum_id], params[:topic_id]) }
      format.js
    end
  end
end

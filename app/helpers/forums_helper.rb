module ForumsHelper
  def recent_topic_activity(topic)
    return topic.replied_at > ((session[:topics] && session[:topics][topic.id]) || 3.days.ago) rescue return false
  end 
  
  def recent_forum_activity(forum)
		return forum.recent_topic.replied_at > ((session[:forums] && session[:forums][forum.id]) || 3.days.ago) rescue return false
  end
end

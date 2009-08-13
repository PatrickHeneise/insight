class TopicActivity < ActiveRecord::Base
	using_access_control
	
	belongs_to :topic
  belongs_to :user
end

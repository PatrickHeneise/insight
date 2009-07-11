class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
	belongs_to :editor, :class_name => "User", :foreign_key => "editor_id"
	
	has_many :topic_activities
end

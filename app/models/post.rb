class Post < ActiveRecord::Base
	using_access_control
	
	validates_presence_of :content
	validates_presence_of :user
	validates_presence_of :topic

  belongs_to :user
  belongs_to :topic
	belongs_to :editor, :class_name => "User", :foreign_key => "editor_id"
end

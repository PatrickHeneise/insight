class Reply < ActiveRecord::Base
  belongs_to :bullet
  belongs_to :user
	belongs_to :editor, :class_name => "User", :foreign_key => "editor_id"
end

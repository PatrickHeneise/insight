class Folder < ActiveRecord::Base
  belongs_to :lecture
  belongs_to :parent, :class_name => "Folder"
	
	has_many :data_items
	has_many :childs, :class_name => "Folder", :foreign_key => "parent_id"
end
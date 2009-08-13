class Folder < ActiveRecord::Base
	using_access_control
	
	acts_as_tree :order => "name"
	
  belongs_to :lecture
	has_many :data_items
end
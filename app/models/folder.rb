class Folder < ActiveRecord::Base
	acts_as_tree :order => "name"
	
  belongs_to :lecture
	has_many :data_items
end
class Room < ActiveRecord::Base
	using_access_control
	
  belongs_to :building
  belongs_to :user
	
	has_many :events
	
	def name
		"#{self.building.code} #{self.number}"
	end
end

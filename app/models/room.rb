class Room < ActiveRecord::Base
  belongs_to :building
  belongs_to :user
	
	has_many :events
end

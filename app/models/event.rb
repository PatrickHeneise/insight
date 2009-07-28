class Event < ActiveRecord::Base
	validates_presence_of :room
	
  belongs_to :lecture
  belongs_to :room
end

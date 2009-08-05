class Event < ActiveRecord::Base
	validates_presence_of :room
	validates_presence_of :title
	validates_length_of :title, :within => 3..255
	validates_presence_of :at_date
	validates_presence_of :at_time
	validates_inclusion_of :is_blocked, :in => [true, false]
	validate :blockevent
	
  belongs_to :lecture
  belongs_to :room
	
	named_scope :lectures, :conditions => ["lecture_id not null"]
	named_scope :events, :conditions => ["lecture_id is null"]
	
	private
		def blockevent
			errors.add("Von-Block muss kleiner sein als Bis-Block") if from_block > to_block
		end
end

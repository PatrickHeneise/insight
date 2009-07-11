class Bullet < ActiveRecord::Base
	include AASM
	
  belongs_to :board
  belongs_to :user
	
	has_many :replies
	has_many :bullet_activities
	
	aasm_column :state
	aasm_initial_state :active
	
	aasm_state :active
	aasm_state :closed
	
	aasm_event :close do
		transitions :from => :active, :to => :closed
	end
	aasm_event :activate do
		transitions :from => :closed, :to => :active
	end
	
	def get_state(user_id)
		return self.bullet_activities.find(:first, :conditions => {:user_id => user_id}).state rescue return "unread"
	end
end

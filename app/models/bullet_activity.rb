class BulletActivity < ActiveRecord::Base
	include AASM
	
  belongs_to :bullet
  belongs_to :user
	
	aasm_column :state
	aasm_initial_state :read
	
	aasm_state :unread
	aasm_state :read
	
	aasm_event :mark_as_read do
		transitions :from => [:read, :unread], :to => :read
	end
	
	aasm_event :mark_as_unread do
		transitions :from => :read, :to => :unread
	end
end

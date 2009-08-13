class Enrollment < ActiveRecord::Base
	using_access_control
	
	include AASM
	
  belongs_to :user
  belongs_to :lecture
	
	aasm_column :level
	aasm_initial_state :common
	
	aasm_state :common
	aasm_state :force
	aasm_state :represent
	aasm_state :manage
	
	aasm_event :enregister do
		transitions :from => :common,									:to => :force
	end
	
	aasm_event :promote do
		transitions :from => [:force, :common],				:to => :represent
	end
	
	aasm_event :demote do
		transitions :from => :represent,							:to => :common
	end
	
	named_scope :commons, :conditions => {:level => "common"}
	named_scope :forced, :conditions => {:level => "force"}
	named_scope :representatives, :conditions => {:level => "represent"}
	named_scope :managers, :conditions => {:level => "manage"}
end
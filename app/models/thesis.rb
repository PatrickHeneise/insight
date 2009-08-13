class Thesis < ActiveRecord::Base
	using_access_control
	
	include AASM
	acts_as_taggable
	
  belongs_to :editor, :class_name => "User", :foreign_key => "editor_id"
  belongs_to :coeditor, :class_name => "User", :foreign_key => "coeditor_id"
  belongs_to :supervisor, :class_name => "User", :foreign_key => "supervisor_id"
  belongs_to :assistant_supervisor, :class_name => "User", :foreign_key => "assistant_supervisor_id"
  belongs_to :course
	
	aasm_column :state
	aasm_initial_state :applied
	
	aasm_state :applied
	aasm_state :processing
	aasm_state :finished
	aasm_state :closed
		
	# Paperclip
	has_attached_file :paper, :url => "/upload/theses/:hashed_id.:extension"
	validates_attachment_size :paper, :less_than => 5120.kilobytes
	validates_attachment_content_type :paper, :content_type => ['application/pdf']
	
	named_scope :applied, :conditions => {:state => "applied"}
	named_scope :processing, :conditions => {:state => "processing"}
	named_scope :finished, :conditions => {:state => "finished"}
	named_scope :closed, :conditions => {:state => "closed"}
end

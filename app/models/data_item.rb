class DataItem < ActiveRecord::Base
	include AASM
	
  belongs_to :folder
  belongs_to :user
	
	aasm_column :state
	aasm_initial_state :new
	
	aasm_state :open
	aasm_state :downloaded
	aasm_state :closed
	
	aasm_event :download do
		transitions :from => :open,										:to => :downloaded
	end
	
	aasm_event :close do
		transitions :from => [:open, :downloaded],		:to => :closed
	end
	
	aasm_event :reopen do
		transitions :from => [:closed, :downloaded],	:to => :open
	end
	
	def set_public_id
		self.public_id = Digest::MD5.hexdigest(self.source_file_name + self.source_file_size.to_s + rand.to_s + Time.now.to_i.to_s)
	end

	named_scope :open, :conditions => {:state => "open"}
	named_scope :downloaded, :conditions => {:state => "downloaded"}
	
	# Paperclip
	has_attached_file(:upload,
			:storage => :filesystem,
			/upload/:folder_id/:filename
			:url => "/upload/:folder_id/:hashed_public_id.:extension",
			:path => ":rails_root/public/:upload/:folder_id/:hashed_public_id.:extension")
end

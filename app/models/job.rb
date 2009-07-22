class Job < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
	
	# Paperclip
	has_attached_file :advertisement, :url => "/advertisements/:id.:extension"
	validates_attachment_size :advertisement, :less_than => 5120.kilobytes
	validates_attachment_content_type :advertisement, :content_type => ['application/pdf']
end

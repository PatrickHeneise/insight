class Comment < ActiveRecord::Base
	using_access_control
	
  belongs_to :user
  belongs_to :article
end

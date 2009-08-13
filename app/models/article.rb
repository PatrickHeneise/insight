class Article < ActiveRecord::Base
	using_access_control
	
  belongs_to :user
  belongs_to :blog
	
	has_many :comments
end

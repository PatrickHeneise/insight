class Blog < ActiveRecord::Base
	using_access_control
	
  belongs_to :department
	
	has_many :articles
	has_many :comments, :through => :articles
end

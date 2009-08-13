class Department < ActiveRecord::Base
	using_access_control
	
  belongs_to :organization
	
	has_many :users
	has_one :blog
	has_many :articles, :through => :blog
	has_many :lectures
	has_many :courses
	has_many :forums
end

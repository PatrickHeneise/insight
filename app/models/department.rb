class Department < ActiveRecord::Base
  belongs_to :organization
	
	has_many :users
	has_one :blog
	has_many :articles, :through => :blog
	has_many :lectures
	has_many :courses
	has_many :forums
end

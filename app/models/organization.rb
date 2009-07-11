class Organization < ActiveRecord::Base
	has_many :departments
	has_many :blogs
	has_many :users, :through => :departments
	has_many :buildings
end

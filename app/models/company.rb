class Company < ActiveRecord::Base
	using_access_control
	
	acts_as_taggable
  belongs_to :address
	
	has_many :users
	has_many :jobs
end

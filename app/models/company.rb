class Company < ActiveRecord::Base
	acts_as_taggable
  belongs_to :address
	
	has_many :users
	has_many :jobs
end

class Address < ActiveRecord::Base
	has_many :users
	has_many :companies

	belongs_to :user

	def national
		"#{street}, #{postcode} #{city}"
	end
	
	def full
		"#{street}, #{postcode} #{city} (#{country})"
	end
end

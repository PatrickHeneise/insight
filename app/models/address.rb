class Address < ActiveRecord::Base
	has_many :users
	has_many :companies
	
	def national
		return street + ", " + postcode + " " + city
	end
	
	def full
		return street + ", " + postcode + " " + city + " (" + country + ")"
	end
end

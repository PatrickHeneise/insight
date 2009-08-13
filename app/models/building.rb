class Building < ActiveRecord::Base
	using_access_control
	
  belongs_to :address
  belongs_to :organization
	
	has_many :rooms
end

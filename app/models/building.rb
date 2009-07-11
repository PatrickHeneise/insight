class Building < ActiveRecord::Base
  belongs_to :address
  belongs_to :organization
	
	has_many :rooms
end

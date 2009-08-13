class BulletActivity < ActiveRecord::Base
	using_access_control
	
  belongs_to :bullet
  belongs_to :user
end

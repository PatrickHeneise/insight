class BulletActivity < ActiveRecord::Base
  belongs_to :bullet
  belongs_to :user
end

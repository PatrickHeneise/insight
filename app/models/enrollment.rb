class Enrollment < ActiveRecord::Base
  belongs_to :user
  belongs_to :lecture
end

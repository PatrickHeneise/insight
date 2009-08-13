class Course < ActiveRecord::Base
	using_access_control
	
  belongs_to :department

	has_many :course_modules
	has_many :users
end

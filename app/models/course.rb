class Course < ActiveRecord::Base
  belongs_to :department

	has_many :course_modules
	has_many :users
end

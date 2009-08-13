class CourseModule < ActiveRecord::Base
	using_access_control
	
  belongs_to :course
	
	has_and_belongs_to_many :lectures
end

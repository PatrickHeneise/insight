class CourseModule < ActiveRecord::Base
  belongs_to :course
	
	has_and_belongs_to_many :lectures
end

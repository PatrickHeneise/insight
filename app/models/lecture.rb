class Lecture < ActiveRecord::Base
  belongs_to :department
	
	has_one :board
	has_one :folder
	has_many :enrollments
	has_many :users, :through => :enrollments
	has_many :events
	
	has_and_belongs_to_many :course_modules
	
	accepts_nested_attributes_for :events, :allow_destroy => :true
end

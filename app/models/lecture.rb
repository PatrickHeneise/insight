class Lecture < ActiveRecord::Base
	validates_presence_of :title
	validates_presence_of :short
	validates_presence_of :description
	validates_numericality_of :credits
	validates_numericality_of :number
	validates_presence_of :department
	validates_presence_of :course_modules
	
  belongs_to :department
	
	has_one :board
	has_one :folder
	has_many :enrollments
	has_many :users, :through => :enrollments
	has_many :events
	
	has_and_belongs_to_many :course_modules
	
	accepts_nested_attributes_for :events, :allow_destroy => :true
end

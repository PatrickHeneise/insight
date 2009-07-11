class Blog < ActiveRecord::Base
  belongs_to :department
	
	has_many :articles
	has_many :comments, :through => :articles
end

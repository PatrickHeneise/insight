class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog
	
	has_many :comments
end

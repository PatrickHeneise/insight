class Board < ActiveRecord::Base
  belongs_to :lecture
	has_many :bullets
end

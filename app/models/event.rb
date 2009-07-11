class Event < ActiveRecord::Base
  belongs_to :lecture
  belongs_to :room
end

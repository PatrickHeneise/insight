class Bullet < ActiveRecord::Base
  before_create :set_default_replied_at_and_sticky
	
  belongs_to :board
  belongs_to :user
	
	has_many :bullet_activities, :conditions => ['active = ?', true], :source => :user, :order => 'users.login'
	
	has_many :replies, :order => 'created_at', :dependent => :destroy do
		def last
			@last_reply ||= find(:first, :order => 'created_at desc')
		end
	end

	protected
    def set_default_replied_at_and_sticky
      self.replied_at = Time.now
    end
end

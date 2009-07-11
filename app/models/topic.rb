class Topic < ActiveRecord::Base
  before_create :set_default_replied_at_and_sticky
	
  belongs_to :forum
  belongs_to :user
	
	has_many :topic_activities, :conditions => ['active = ?', true], :source => :user, :order => 'users.login'
	
	has_many :posts, :order => 'posts.created_at', :dependent => :destroy do
		def last
			@last_post ||= find(:first, :order => 'posts.created_at desc')
		end
	end
	
	def hit!
		self.class.increment_counter :hits, id
	end
	
	def sticky? 
		sticky == true 
	end
	
	protected
    def set_default_replied_at_and_sticky
      self.replied_at = Time.now
      self.sticky   ||= 0
    end
end

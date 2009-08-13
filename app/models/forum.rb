class Forum < ActiveRecord::Base
	using_access_control
	
	acts_as_list
	
	validates_presence_of :title
	
  belongs_to :department
	
	has_many :topics, :order => "sticky desc, replied_at desc, created_at desc", :dependent => :destroy do
		def first
			@first_topic ||= find(:first)
		end
	end
	
	has_many :recent_topics, :class_name => 'Topic', :order => 'replied_at desc' do
		def first
			@first_recent_topic ||= find(:first)
		end
	end
	has_one :recent_topic, :class_name => 'Topic', :order => 'replied_at desc'
	
	has_many :posts, :through => :topics, :order => 'posts.created_at desc' do
		def last
			@last_post ||= find(:first, :include => :user)
		end
	end
	
	has_many :subscriptions
	has_many :users, :through => :subscriptions
	
	def subscribed?(user)
		sub = subscriptions.find_by_user_id(user)
		return !sub.nil?
	end
	
	named_scope :noninternal, lambda { |department| {:conditions => ['internal = \'f\' and department_id != ?',department], :order => 'position desc'}}
	named_scope :internal, lambda { |department| {:conditions => ['internal = \'t\' and department_id = ?',department], :order => 'position desc'}}
end
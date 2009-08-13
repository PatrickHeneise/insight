class Board < ActiveRecord::Base
	using_access_control
	
  belongs_to :lecture

	has_many :bullets, :order => "replied_at desc, created_at desc", :dependent => :destroy do
		def first
			@first_topic ||= find(:first)
		end
	end
	
	has_many :recent_bullets, :class_name => 'Bullet', :order => 'replied_at desc' do
		def first
			@first_recent_bullet ||= find(:first)
		end
	end
	has_one :recent_bullets, :class_name => 'Bullet', :order => 'replied_at desc'
	
	has_many :replies, :through => :bullets, :order => 'reply.created_at desc' do
		def last
			@last_post ||= find(:first, :include => :user)
		end
	end
end

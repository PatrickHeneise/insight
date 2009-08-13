authorization do
	role :guest do
    has_permission_on :users, :to => [:create, :update]
  end
  
  role :Student do
    has_permission_on :blogs, :to => :read
  end
  
	role :Lecturer do
	end
	
	role :Employee do
	end
	
	role :Professor do
	end
	
  role :Administrator do
		has_permission_on :blogs, :to => :manage
		has_permission_on :lectures, :to => :manage
		has_permission_on :folders, :to => :manage
		has_permission_on :forums, :to => :manage
		has_permission_on :buildings, :to => :manage
		has_permission_on :articles, :to => :manage
		has_permission_on :administration, :to => :manage
		has_permission_on :courses, :to => :manage
		has_permission_on :course_modules, :to => :manage
		has_permission_on :topics, :to => :manage
		has_permission_on :posts, :to => :manage
  end
	
	role :Developer do
		includes :Administrator
    has_permission_on :authorization_rules, :to => :manage
    has_permission_on :authorization_usages, :to => :manage
	end
end

privileges do
  privilege :manage, :includes => [:create, :read, :update, :delete]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end
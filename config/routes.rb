ActionController::Routing::Routes.draw do |map|
  map.resources :theses, :collection => { :applied => :get, :processing => :get, :own => :get }
  map.resources :jobs
	map.resources :events, :except => [:edit, :new, :update, :destroy]
  map.resources :addresses
  map.resources :companies
  map.resources :organizations, :except => [:edit, :new, :update, :destroy]
	map.resources :enrollments
  map.resources :users, :collection => { :create_intern => :post, :create_extern => :post }
	
	map.resource :blog, :except => [:edit, :new, :update, :destroy]
	map.resource :user_session
	map.resource :account, :controller => "users"

  map.resources :buildings, :except => [:edit, :new, :update, :destroy] do |building|
		building.resources :rooms, :except => [:edit, :new, :update, :destroy]
	end
	
  map.resources :articles do |article|
		article.resources :comments
	end
	
  map.resources :courses, :except => [:edit, :new, :update, :destroy], :member => { :overview => :get, :schedule => :get } do |course|
		course.resources :course_modules
	end
	
	map.resources :departments, :except => [:edit, :new, :update, :destroy] do |department|
		department.resources :lectures, :except => [:edit, :new, :update, :destroy] do |lecture|
			lecture.resources :enrollments, :collection => { :enrol => :get, :unrol => :get }
			lecture.resources :folders, :except => [:edit, :new, :update, :destroy] do |folder|
				folder.resources :data_items, :except => [:edit, :new, :update, :destroy]
			end
			
			lecture.resources :boards, :except => [:edit, :new, :update, :destroy] do |board|
				board.resources :bullets do |bullet|
					bullet.resources :replies
				end
			end
		end
		
		map.resources :forums, :except => [:edit, :new, :update, :destroy], :member => { :subscribe => :get, :unsubscribe => :get } do |forum|
			forum.resources :topics do |topic|
				topic.resources :posts
			end
		end
	end
	
	map.namespace :admin do |admin|
		admin.pages '/dashboard', :controller => 'pages', :action => 'index'
		admin.resources :blogs, :except => [:index, :show] do |blog|
			blog.resources :articles, :except => [:index, :show]
		end
		admin.resources :boards, :except => [:index, :show]
		admin.resources :buildings, :except => [:index, :show] do |building|
			building.resources :rooms, :except => [:index, :show]
		end
		admin.resources :courses do |course|
			course.resources :course_modules, :except => [:index, :show]
		end
		admin.resources :events, :except => [:index, :show]
		admin.resources :folders, :except => [:index, :show], :has_many => :data_items, :except => [:index, :show]
		admin.resources :lectures, :except => [:index, :show] do |lecture|
			lecture.resources :enrollments, :except => [:index, :show]
		end
		admin.resources :forums, :except => [:index, :show]
		admin.resources :users, :member => { :activate => :get, :deactivate => :get }
	end

	map.logout '/logout', :controller => 'UserSessions', :action => 'destroy'
	map.login '/login', :controller => 'UserSessions', :action => 'new'
	map.service '/service', :controller => 'Service', :action => 'index'
	map.media '/media', :controller => 'MediaCenter', :action => 'index'
	map.register '/register', :controller => 'Users', :action => 'new'
	map.lectures '/lecture-plan', :controller => 'Courses', :action => 'overview'
	map.calendar '/calendar', :controller => 'Events', :action => 'index'
	
	# Return blog articles for year, year/month, year/month/day
	map.date '/blog/:year/:month/:day',
		:controller => "blog",
		:action => "show_date",
		:requirements => {	:year => /(19|20)\d\d/,
												:month => /[01]?\d/,
												:day => /[0-3]?\d/},
		:day => nil,
		:month => nil
	map.recent_topics '/topics/recent', :controller => 'Topics', :action => 'recent'
	
	map.with_options :controller => 'Pages' do |pages|
		pages.root														:action => 'index'     # static home page
		pages.home '/home',										:action => 'index'
	end
	
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

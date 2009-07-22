ActionController::Routing::Routes.draw do |map|
  map.resources :jobs
	map.resources :events
  map.resources :addresses
  map.resources :companies
  map.resources :organizations
  map.resources :users, :collection => { :create_intern => :post, :create_extern => :post }
	
	map.resource :blog
	map.resource :user_session
	map.resource :account, :controller => "users"

  map.resources :buildings do |building|
		building.resources :rooms
	end
	
  map.resources :articles do |article|
		article.resources :comments
	end
	
	map.resources :courses, :member => { :overview => :get }
  map.resources :courses do |course|
		course.resources :course_modules
	end
	
	map.resources :departments do |department|
		department.resources :lectures, :member => { :enrol => :get, :unrol => :get }
		department.resources :lectures do |lecture|
			lecture.resources :folders do |folder|
				folder.resources :data_items
			end
			
			lecture.resources :boards do |board|
				board.resources :bullets do |bullet|
					bullet.resources :replies
				end
			end
		end
		
		map.resources :forums, :member => { :subscribe => :get, :unsubscribe => :get }
		map.resources :forums do |forum|
			forum.resources :topics do |topic|
				topic.resources :posts
			end
		end
	end
	
	map.namespace :admin do |admin|
		admin.resources :articles
		admin.resources :blogs
		admin.resources :boards
		admin.resources :buildings do |building|
			building.resources :rooms
		end
		admin.resources :courses
		admin.resources :folders, :has_many => :data_items
		admin.resources :lectures
		admin.resources :forums
	end

	map.logout '/logout', :controller => 'UserSessions', :action => 'destroy'
	map.login '/login', :controller => 'UserSessions', :action => 'new'
	map.service '/service', :controller => 'Service', :action => 'index'
	map.media '/media', :controller => 'MediaCenter', :action => 'index'
	map.register '/register', :controller => 'Users', :action => 'new'
	map.overview '/lecture-plan', :controller => 'Courses', :action => 'overview'
	
	# Return blog articles for year, year/month, year/month/day
	map.date '/blog/:year/:month/:day',
		:controller => "blog",
		:action => "show_date",
		:requirements => {	:year => /(19|20)\d\d/,
												:month => /[01]?\d/,
												:day => /[0-3]?\d/},
		:day => nil,
		:month => nil
	
	
	map.with_options :controller => 'Pages' do |pages|
		pages.root														:action => 'index'     # static home page
		pages.calendar '/calendar',						:action => 'calendar'
		pages.home '/home',										:action => 'index'
	end
	
#  map.connect ':controller/:action/:id'
#  map.connect ':controller/:action/:id.:format'
end

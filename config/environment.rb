# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
	config.gem "authlogic"
	config.gem "rubyist-aasm", :lib => "aasm"
	config.gem "stffn-declarative_authorization", :lib => "declarative_authorization"
	config.gem "mislav-will_paginate", :version => "~> 2.3.8", :lib => "will_paginate", :source => "http://gems.github.com"
	config.gem "cucumber", :lib => false, :version => ">=0.3.0"
	config.gem "rgrove-sanitize"
	config.gem "flickr-fu", :lib => "flickr_fu"
	config.gem "youtube-g", :lib => "youtube-g"
	
  # Only load the plugins named here, in the order given (default is alphabetical).
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :auto_complete_jquery, :paperclip ]

  # Skip frameworks you're not going to use. To use Rails without a database,
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  #config.time_zone = 'Berlin'
	#config.active_record.default_timezone = 'UTC'

  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
  config.i18n.default_locale = :de
end
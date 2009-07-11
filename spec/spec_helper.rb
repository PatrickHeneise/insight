ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require File.expand_path(File.dirname(__FILE__) + "/../features/support/blueprints")
require File.expand_path(File.dirname(__FILE__) + "/spec_helpers/authentication_spec_helper")
require File.expand_path(File.dirname(__FILE__) + "/spec_helpers/controller_spec_helper")
require 'spec/autorun'
require 'spec/rails'
require 'authlogic/test_case'
#require 'email_spec/helpers'
#require 'email_spec/matchers'


Spec::Runner.configure do |config|
  config.include(Authentication::SpecHelpers)
  config.include(ControllerSpecHelper, :type => :controller)
#  config.include(EmailSpec::Helpers)
#  config.include(EmailSpec::Matchers)

  config.use_transactional_fixtures = true
  config.use_instantiated_fixtures  = false
  config.fixture_path = RAILS_ROOT + '/spec/fixtures/'

  config.before(:each) { Sham.reset }
end
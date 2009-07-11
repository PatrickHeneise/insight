require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  before(:each) do
    @valid_attributes = {
      :login => "value for login",
      :crypted_password => "value for crypted_password",
      :persistence_token => "value for persistence_token",
      :last_login_at => Time.now,
      :current_login_at => Time.now,
      :last_request_at => Time.now,
      :last_login_ip => "value for last_login_ip",
      :current_login_ip => "value for current_login_ip",
      :email => "value for email",
      :private_email => "value for private_email",
      :icq => "value for icq",
      :phone => "value for phone",
      :activities => "value for activities",
      :publications => "value for publications",
      :presentations => "value for presentations",
      :biography => "value for biography",
      :company => 1,
      :department => 1,
      :surname => "value for surname",
      :name => "value for name",
      :address => 1,
      :home_address => 1,
			:course => "course",
			:name => "value",
			:surname => "value"
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end
end

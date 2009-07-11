require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Address do
  before(:each) do
    @valid_attributes = {
      :street => "value for street",
      :street_addition => "value for street_addition",
      :city => "value for city",
      :postcode => "value for postcode",
      :state => "value for state",
      :country => "value for country"
    }
  end

  it "should create a new instance given valid attributes" do
    Address.create!(@valid_attributes)
  end
end

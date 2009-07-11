require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Company do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :address => 1,
      :industry => "value for industry"
    }
  end

  it "should create a new instance given valid attributes" do
    Company.create!(@valid_attributes)
  end
end

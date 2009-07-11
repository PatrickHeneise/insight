require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Subscription do
  before(:each) do
    @valid_attributes = {
      :user => 1,
      :forum => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Subscription.create!(@valid_attributes)
  end
end

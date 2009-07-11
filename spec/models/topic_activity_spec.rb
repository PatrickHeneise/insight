require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TopicActivity do
  before(:each) do
    @valid_attributes = {
      :topic => ,
      :user => ,
      :state => "value for state"
    }
  end

  it "should create a new instance given valid attributes" do
    TopicActivity.create!(@valid_attributes)
  end
end

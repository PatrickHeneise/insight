require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Reply do
  before(:each) do
    @valid_attributes = {
      :bullet => 1,
      :content => "value for content",
      :user => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Reply.create!(@valid_attributes)
  end
end

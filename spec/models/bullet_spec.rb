require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Bullet do
  before(:each) do
    @valid_attributes = {
      :board => 1,
      :title => "value for title",
      :content => "value for content",
      :user => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Bullet.create!(@valid_attributes)
  end
end

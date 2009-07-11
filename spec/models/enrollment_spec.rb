require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Enrollment do
  before(:each) do
    @valid_attributes = {
      :user => 1,
      :lecture => 1,
      :due => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Enrollment.create!(@valid_attributes)
  end
end

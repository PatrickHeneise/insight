require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Event do
  before(:each) do
    @valid_attributes = {
      :at_date => Date.today,
      :at_time => Time.now,
      :to_date => Date.today,
      :to_time => Time.now,
      :from_block => 1,
      :to_block => 1,
      :repeatFrequency => "value for repeatFrequency",
      :repeatInterval => 1,
      :lecture => 1,
      :room => 1,
      :is_blocked => false
    }
  end

  it "should create a new instance given valid attributes" do
    Event.create!(@valid_attributes)
  end
end

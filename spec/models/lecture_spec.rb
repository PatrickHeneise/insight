require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Lecture do
  before(:each) do
    @valid_attributes = {
      :department => 1,
      :title => "value for title",
      :short => "value for short",
      :description => "value for description",
      :visible => false,
      :active => false,
      :credits => 1,
      :number => 1,
      :user => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Lecture.create!(@valid_attributes)
  end
end

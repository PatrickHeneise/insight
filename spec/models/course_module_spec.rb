require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CourseModule do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :short => "value for short",
      :visible => false,
      :level => 1,
      :description => "value for description",
      :course => 1,
      :semester => 1
    }
  end

  it "should create a new instance given valid attributes" do
    CourseModule.create!(@valid_attributes)
  end
end

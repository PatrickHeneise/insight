require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Forum do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
			:description => "value",
			:position => 1
      :department => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Forum.create!(@valid_attributes)
  end
end

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Building do
  before(:each) do
    @valid_attributes = {
      :code => "value for code",
      :address => ,
      :organization => ,
      :open_from => Time.now,
      :open_to => Time.now,
      :info => "value for info"
    }
  end

  it "should create a new instance given valid attributes" do
    Building.create!(@valid_attributes)
  end
end

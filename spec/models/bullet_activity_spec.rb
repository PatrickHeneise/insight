require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BulletActivity do
  before(:each) do
    @valid_attributes = {
      :bullet => ,
      :user => ,
      :state => "value for state"
    }
  end

  it "should create a new instance given valid attributes" do
    BulletActivity.create!(@valid_attributes)
  end
end

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Jobs do
  before(:each) do
    @valid_attributes = {
      :company_id => 1,
      :user_id => 1,
      :title => "value for title",
      :description => "value for description",
      :prerequisit => "value for prerequisit",
      :period => "value for period",
      :payment => 1,
      :timeout => Date.today
    }
  end

  it "should create a new instance given valid attributes" do
    Jobs.create!(@valid_attributes)
  end
end

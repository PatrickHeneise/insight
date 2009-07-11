require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DataItem do
  before(:each) do
    @valid_attributes = {
      :folder => 1,
      :upload_file_name => "value for upload_file_name",
      :upload_content_type => "value for upload_content_type",
      :upload_file_size => 1,
      :upload_updated_at => Time.now,
      :user => 1,
      :state => "value for state"
    }
  end

  it "should create a new instance given valid attributes" do
    DataItem.create!(@valid_attributes)
  end
end

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/data_items/index.html.erb" do
  include DataItemsHelper
  
  before(:each) do
    assigns[:data_items] = [
      stub_model(DataItem,
        :folder => 1,
        :upload_file_name => "value for upload_file_name",
        :upload_content_type => "value for upload_content_type",
        :upload_file_size => 1,
        :user => 1,
        :state => "value for state"
      ),
      stub_model(DataItem,
        :folder => 1,
        :upload_file_name => "value for upload_file_name",
        :upload_content_type => "value for upload_content_type",
        :upload_file_size => 1,
        :user => 1,
        :state => "value for state"
      )
    ]
  end

  it "renders a list of data_items" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for upload_file_name".to_s, 2)
    response.should have_tag("tr>td", "value for upload_content_type".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for state".to_s, 2)
  end
end


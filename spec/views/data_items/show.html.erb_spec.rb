require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/data_items/show.html.erb" do
  include DataItemsHelper
  before(:each) do
    assigns[:data_item] = @data_item = stub_model(DataItem,
      :folder => 1,
      :upload_file_name => "value for upload_file_name",
      :upload_content_type => "value for upload_content_type",
      :upload_file_size => 1,
      :user => 1,
      :state => "value for state"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(//)
    response.should have_text(/value\ for\ upload_file_name/)
    response.should have_text(/value\ for\ upload_content_type/)
    response.should have_text(/1/)
    response.should have_text(//)
    response.should have_text(/value\ for\ state/)
  end
end


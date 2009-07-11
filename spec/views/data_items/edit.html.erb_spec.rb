require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/data_items/edit.html.erb" do
  include DataItemsHelper
  
  before(:each) do
    assigns[:data_item] = @data_item = stub_model(DataItem,
      :new_record? => false,
      :folder => 1,
      :upload_file_name => "value for upload_file_name",
      :upload_content_type => "value for upload_content_type",
      :upload_file_size => 1,
      :user => 1,
      :state => "value for state"
    )
  end

  it "renders the edit data_item form" do
    render
    
    response.should have_tag("form[action=#{data_item_path(@data_item)}][method=post]") do
      with_tag('input#data_item_folder[name=?]', "data_item[folder]")
      with_tag('input#data_item_upload_file_name[name=?]', "data_item[upload_file_name]")
      with_tag('input#data_item_upload_content_type[name=?]', "data_item[upload_content_type]")
      with_tag('input#data_item_upload_file_size[name=?]', "data_item[upload_file_size]")
      with_tag('input#data_item_user[name=?]', "data_item[user]")
      with_tag('input#data_item_state[name=?]', "data_item[state]")
    end
  end
end



require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/folders/new.html.erb" do
  include FoldersHelper
  
  before(:each) do
    assigns[:folder] = stub_model(Folder,
      :new_record? => true,
      :lecture => 1,
      :parent => 1,
      :name => "value for name"
    )
  end

  it "renders new folder form" do
    render
    
    response.should have_tag("form[action=?][method=post]", folders_path) do
      with_tag("input#folder_data_area[name=?]", "folder[data_area]")
      with_tag("input#folder_parent[name=?]", "folder[parent]")
      with_tag("input#folder_name[name=?]", "folder[name]")
    end
  end
end



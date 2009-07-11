require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/folders/index.html.erb" do
  include FoldersHelper
  
  before(:each) do
    assigns[:folders] = [
      stub_model(Folder,
        :lecture => 1,
        :parent => 1,
        :name => "value for name"
      ),
      stub_model(Folder,
        :lecture => 1,
        :parent => 1,
        :name => "value for name"
      )
    ]
  end

  it "renders a list of folders" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for name".to_s, 2)
  end
end


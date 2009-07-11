require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/folders/show.html.erb" do
  include FoldersHelper
  before(:each) do
    assigns[:folder] = @folder = stub_model(Folder,
      :lecture => 1,
      :parent => 1,
      :name => "value for name"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(//)
    response.should have_text(//)
    response.should have_text(/value\ for\ name/)
  end
end


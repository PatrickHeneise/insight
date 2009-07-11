require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/blogs/show.html.erb" do
  include BlogsHelper
  before(:each) do
    assigns[:blog] = @blog = stub_model(Blog,
      :title => "value for title",
      :unit => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title/)
    response.should have_text(//)
  end
end


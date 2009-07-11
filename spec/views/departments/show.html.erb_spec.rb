require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/departments/show.html.erb" do
  include DepartmentsHelper
  before(:each) do
    assigns[:department] = @department = stub_model(Department,
      :title => "value for title",
      :description => "value for description",
      :organization => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(//)
  end
end


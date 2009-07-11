require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/courses/show.html.erb" do
  include CoursesHelper
  before(:each) do
    assigns[:course] = @course = stub_model(Course,
      :title => "value for title",
      :short => "value for short",
      :unit => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ short/)
    response.should have_text(//)
  end
end


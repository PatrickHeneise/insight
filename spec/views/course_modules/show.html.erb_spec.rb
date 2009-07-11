require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/course_modules/show.html.erb" do
  include CourseModulesHelper
  before(:each) do
    assigns[:course_module] = @course_module = stub_model(CourseModule,
      :title => "value for title",
      :short => "value for short",
      :visible => false,
      :level => 1,
      :description => "value for description",
      :course => 1,
      :semester => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ short/)
    response.should have_text(/false/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(//)
    response.should have_text(/1/)
  end
end


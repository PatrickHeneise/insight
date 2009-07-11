require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/courses/index.html.erb" do
  include CoursesHelper
  
  before(:each) do
    assigns[:courses] = [
      stub_model(Course,
        :title => "value for title",
        :short => "value for short",
        :unit => 1
      ),
      stub_model(Course,
        :title => "value for title",
        :short => "value for short",
        :unit => 1
      )
    ]
  end

  it "renders a list of courses" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for short".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end


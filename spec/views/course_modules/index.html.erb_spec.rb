require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/course_modules/index.html.erb" do
  include CourseModulesHelper
  
  before(:each) do
    assigns[:course_modules] = [
      stub_model(CourseModule,
        :title => "value for title",
        :short => "value for short",
        :visible => false,
        :level => 1,
        :description => "value for description",
        :course => 1,
        :semester => 1
      ),
      stub_model(CourseModule,
        :title => "value for title",
        :short => "value for short",
        :visible => false,
        :level => 1,
        :description => "value for description",
        :course => 1,
        :semester => 1
      )
    ]
  end

  it "renders a list of course_modules" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for short".to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end


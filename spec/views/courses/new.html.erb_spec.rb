require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/courses/new.html.erb" do
  include CoursesHelper
  
  before(:each) do
    assigns[:course] = stub_model(Course,
      :new_record? => true,
      :title => "value for title",
      :short => "value for short",
      :unit => 1
    )
  end

  it "renders new course form" do
    render
    
    response.should have_tag("form[action=?][method=post]", courses_path) do
      with_tag("input#course_title[name=?]", "course[title]")
      with_tag("input#course_short[name=?]", "course[short]")
      with_tag("input#course_unit[name=?]", "course[unit]")
    end
  end
end



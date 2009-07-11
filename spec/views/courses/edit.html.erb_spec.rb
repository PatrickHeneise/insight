require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/courses/edit.html.erb" do
  include CoursesHelper
  
  before(:each) do
    assigns[:course] = @course = stub_model(Course,
      :new_record? => false,
      :title => "value for title",
      :short => "value for short",
      :unit => 1
    )
  end

  it "renders the edit course form" do
    render
    
    response.should have_tag("form[action=#{course_path(@course)}][method=post]") do
      with_tag('input#course_title[name=?]', "course[title]")
      with_tag('input#course_short[name=?]', "course[short]")
      with_tag('input#course_unit[name=?]', "course[unit]")
    end
  end
end



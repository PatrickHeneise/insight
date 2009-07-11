require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/lectures/new.html.erb" do
  include LecturesHelper
  
  before(:each) do
    assigns[:lecture] = stub_model(Lecture,
      :new_record? => true,
      :unit => 1,
      :title => "value for title",
      :short => "value for short",
      :description => "value for description",
      :visible => false,
      :active => false,
      :credits => 1,
      :number => 1,
      :user => 1
    )
  end

  it "renders new lecture form" do
    render
    
    response.should have_tag("form[action=?][method=post]", lectures_path) do
      with_tag("input#lecture_unit[name=?]", "lecture[unit]")
      with_tag("input#lecture_title[name=?]", "lecture[title]")
      with_tag("input#lecture_short[name=?]", "lecture[short]")
      with_tag("textarea#lecture_description[name=?]", "lecture[description]")
      with_tag("input#lecture_visible[name=?]", "lecture[visible]")
      with_tag("input#lecture_active[name=?]", "lecture[active]")
      with_tag("input#lecture_credits[name=?]", "lecture[credits]")
      with_tag("input#lecture_number[name=?]", "lecture[number]")
      with_tag("input#lecture_user[name=?]", "lecture[user]")
    end
  end
end



require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/forums/new.html.erb" do
  include ForumsHelper
  
  before(:each) do
    assigns[:forum] = stub_model(Forum,
      :new_record? => true,
      :title => "value for title",
      :unit => 1
    )
  end

  it "renders new forum form" do
    render
    
    response.should have_tag("form[action=?][method=post]", forums_path) do
      with_tag("input#forum_title[name=?]", "forum[title]")
      with_tag("input#forum_unit[name=?]", "forum[unit]")
    end
  end
end



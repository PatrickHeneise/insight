require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/blogs/new.html.erb" do
  include BlogsHelper
  
  before(:each) do
    assigns[:blog] = stub_model(Blog,
      :new_record? => true,
      :title => "value for title",
      :unit => 1
    )
  end

  it "renders new blog form" do
    render
    
    response.should have_tag("form[action=?][method=post]", blogs_path) do
      with_tag("input#blog_title[name=?]", "blog[title]")
      with_tag("input#blog_unit[name=?]", "blog[unit]")
    end
  end
end



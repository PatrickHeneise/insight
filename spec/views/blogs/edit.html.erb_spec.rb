require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/blogs/edit.html.erb" do
  include BlogsHelper
  
  before(:each) do
    assigns[:blog] = @blog = stub_model(Blog,
      :new_record? => false,
      :title => "value for title",
      :unit => 1
    )
  end

  it "renders the edit blog form" do
    render
    
    response.should have_tag("form[action=#{blog_path(@blog)}][method=post]") do
      with_tag('input#blog_title[name=?]', "blog[title]")
      with_tag('input#blog_unit[name=?]', "blog[unit]")
    end
  end
end



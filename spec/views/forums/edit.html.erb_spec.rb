require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/forums/edit.html.erb" do
  include ForumsHelper
  
  before(:each) do
    assigns[:forum] = @forum = stub_model(Forum,
      :new_record? => false,
      :title => "value for title",
			:description => "1",
			:position => 1
      :department => 1
    )
  end

  it "renders the edit forum form" do
    render
    
    response.should have_tag("form[action=#{forum_path(@forum)}][method=post]") do
      with_tag('input#forum_title[name=?]', "forum[title]")
      with_tag('input#forum_unit[name=?]', "forum[unit]")
    end
  end
end



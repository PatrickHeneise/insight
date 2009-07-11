require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/topics/new.html.erb" do
  include TopicsHelper
  
  before(:each) do
    assigns[:topic] = stub_model(Topic,
      :new_record? => true,
      :title => "value for title",
      :forum => 1,
			:content => "value",
      :user => 1
    )
  end

  it "renders new topic form" do
    render
    
    response.should have_tag("form[action=?][method=post]", topics_path) do
      with_tag("input#topic_title[name=?]", "topic[title]")
      with_tag("input#topic_forum[name=?]", "topic[forum]")
			with_tag("input#topic_content[name=?]", "topic[content]")
      with_tag("input#topic_user[name=?]", "topic[user]")
    end
  end
end



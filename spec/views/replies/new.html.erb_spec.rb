require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/replies/new.html.erb" do
  include RepliesHelper
  
  before(:each) do
    assigns[:reply] = stub_model(Reply,
      :new_record? => true,
      :bullet => 1,
      :content => "value for content",
      :user => 1
    )
  end

  it "renders new reply form" do
    render
    
    response.should have_tag("form[action=?][method=post]", replies_path) do
      with_tag("input#reply_bullet[name=?]", "reply[bullet]")
      with_tag("textarea#reply_content[name=?]", "reply[content]")
      with_tag("input#reply_user[name=?]", "reply[user]")
    end
  end
end



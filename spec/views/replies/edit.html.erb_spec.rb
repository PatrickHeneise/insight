require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/replies/edit.html.erb" do
  include RepliesHelper
  
  before(:each) do
    assigns[:reply] = @reply = stub_model(Reply,
      :new_record? => false,
      :bullet => 1,
      :content => "value for content",
      :user => 1
    )
  end

  it "renders the edit reply form" do
    render
    
    response.should have_tag("form[action=#{reply_path(@reply)}][method=post]") do
      with_tag('input#reply_bullet[name=?]', "reply[bullet]")
      with_tag('textarea#reply_content[name=?]', "reply[content]")
      with_tag('input#reply_user[name=?]', "reply[user]")
    end
  end
end



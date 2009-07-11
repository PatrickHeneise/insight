require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/posts/new.html.erb" do
  include PostsHelper
  
  before(:each) do
    assigns[:post] = stub_model(Post,
      :new_record? => true,
      :content => "value for content",
      :user => 1,
      :topic => 1
    )
  end

  it "renders new post form" do
    render
    
    response.should have_tag("form[action=?][method=post]", posts_path) do
      with_tag("textarea#post_content[name=?]", "post[content]")
      with_tag("input#post_user[name=?]", "post[user]")
      with_tag("input#post_topic[name=?]", "post[topic]")
    end
  end
end



require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/posts/edit.html.erb" do
  include PostsHelper
  
  before(:each) do
    assigns[:post] = @post = stub_model(Post,
      :new_record? => false,
      :content => "value for content",
      :user => 1,
      :topic => 1
    )
  end

  it "renders the edit post form" do
    render
    
    response.should have_tag("form[action=#{post_path(@post)}][method=post]") do
      with_tag('textarea#post_content[name=?]', "post[content]")
      with_tag('input#post_user[name=?]', "post[user]")
      with_tag('input#post_topic[name=?]', "post[topic]")
    end
  end
end



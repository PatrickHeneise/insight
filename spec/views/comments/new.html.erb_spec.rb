require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/comments/new.html.erb" do
  include CommentsHelper
  
  before(:each) do
    assigns[:comment] = stub_model(Comment,
      :new_record? => true,
      :content => "value for content",
      :user => 1,
      :article => 1
    )
  end

  it "renders new comment form" do
    render
    
    response.should have_tag("form[action=?][method=post]", comments_path) do
      with_tag("textarea#comment_content[name=?]", "comment[content]")
      with_tag("input#comment_user[name=?]", "comment[user]")
      with_tag("input#comment_article[name=?]", "comment[article]")
    end
  end
end



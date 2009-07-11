require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/comments/edit.html.erb" do
  include CommentsHelper
  
  before(:each) do
    assigns[:comment] = @comment = stub_model(Comment,
      :new_record? => false,
      :content => "value for content",
      :user => 1,
      :article => 1
    )
  end

  it "renders the edit comment form" do
    render
    
    response.should have_tag("form[action=#{comment_path(@comment)}][method=post]") do
      with_tag('textarea#comment_content[name=?]', "comment[content]")
      with_tag('input#comment_user[name=?]', "comment[user]")
      with_tag('input#comment_article[name=?]', "comment[article]")
    end
  end
end



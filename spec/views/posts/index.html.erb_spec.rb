require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/posts/index.html.erb" do
  include PostsHelper
  
  before(:each) do
    assigns[:posts] = [
      stub_model(Post,
        :content => "value for content",
        :user => 1,
        :topic => 1
      ),
      stub_model(Post,
        :content => "value for content",
        :user => 1,
        :topic => 1
      )
    ]
  end

  it "renders a list of posts" do
    render
    response.should have_tag("tr>td", "value for content".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end


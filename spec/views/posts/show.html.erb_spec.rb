require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/posts/show.html.erb" do
  include PostsHelper
  before(:each) do
    assigns[:post] = @post = stub_model(Post,
      :content => "value for content",
      :user => 1,
      :topic => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ content/)
    response.should have_text(//)
    response.should have_text(//)
  end
end


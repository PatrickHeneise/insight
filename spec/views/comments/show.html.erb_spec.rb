require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/comments/show.html.erb" do
  include CommentsHelper
  before(:each) do
    assigns[:comment] = @comment = stub_model(Comment,
      :content => "value for content",
      :user => 1,
      :article => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ content/)
    response.should have_text(//)
    response.should have_text(//)
  end
end


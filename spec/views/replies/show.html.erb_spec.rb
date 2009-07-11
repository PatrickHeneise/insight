require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/replies/show.html.erb" do
  include RepliesHelper
  before(:each) do
    assigns[:reply] = @reply = stub_model(Reply,
      :bullet => 1,
      :content => "value for content",
      :user => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(//)
    response.should have_text(/value\ for\ content/)
    response.should have_text(//)
  end
end


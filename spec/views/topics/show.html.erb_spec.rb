require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/topics/show.html.erb" do
  include TopicsHelper
  before(:each) do
    assigns[:topic] = @topic = stub_model(Topic,
      :title => "value for title",
      :forum => 1,
			:content => "value",
      :user => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title/)
    response.should have_text(//)
    response.should have_text(//)
		response.should have_text(//)
  end
end


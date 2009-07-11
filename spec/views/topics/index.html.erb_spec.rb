require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/topics/index.html.erb" do
  include TopicsHelper
  
  before(:each) do
    assigns[:topics] = [
      stub_model(Topic,
        :title => "value for title",
        :forum => 1,
				:content => "value",
        :user => 1
      ),
      stub_model(Topic,
        :title => "value for title",
        :forum => 1,
				:content => "value",
        :user => 1
      )
    ]
  end

  it "renders a list of topics" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
		response.should have_tag("tr>td", 1.to_s, 2)
  end
end


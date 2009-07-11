require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/replies/index.html.erb" do
  include RepliesHelper
  
  before(:each) do
    assigns[:replies] = [
      stub_model(Reply,
        :bullet => 1,
        :content => "value for content",
        :user => 1
      ),
      stub_model(Reply,
        :bullet => 1,
        :content => "value for content",
        :user => 1
      )
    ]
  end

  it "renders a list of replies" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for content".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end


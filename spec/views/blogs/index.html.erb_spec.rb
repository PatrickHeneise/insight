require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/blogs/index.html.erb" do
  include BlogsHelper
  
  before(:each) do
    assigns[:blogs] = [
      stub_model(Blog,
        :title => "value for title",
        :unit => 1
      ),
      stub_model(Blog,
        :title => "value for title",
        :unit => 1
      )
    ]
  end

  it "renders a list of blogs" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end


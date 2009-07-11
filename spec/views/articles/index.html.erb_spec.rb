require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/articles/index.html.erb" do
  include ArticlesHelper
  
  before(:each) do
    assigns[:articles] = [
      stub_model(Article,
        :title => "value for title",
        :content => "value for content",
        :user => 1,
        :blog => 1
      ),
      stub_model(Article,
        :title => "value for title",
        :content => "value for content",
        :user => 1,
        :blog => 1
      )
    ]
  end

  it "renders a list of articles" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for content".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end


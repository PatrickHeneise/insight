require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/bullets/index.html.erb" do
  include BulletsHelper
  
  before(:each) do
    assigns[:bullets] = [
      stub_model(Bullet,
        :board => 1,
        :title => "value for title",
        :content => "value for content",
        :user => 1
      ),
      stub_model(Bullet,
        :board => 1,
        :title => "value for title",
        :content => "value for content",
        :user => 1
      )
    ]
  end

  it "renders a list of bullets" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for content".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end


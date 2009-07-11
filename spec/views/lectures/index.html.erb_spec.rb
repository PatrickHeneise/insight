require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/lectures/index.html.erb" do
  include LecturesHelper
  
  before(:each) do
    assigns[:lectures] = [
      stub_model(Lecture,
        :unit => 1,
        :title => "value for title",
        :short => "value for short",
        :description => "value for description",
        :visible => false,
        :active => false,
        :credits => 1,
        :number => 1,
        :user => 1
      ),
      stub_model(Lecture,
        :unit => 1,
        :title => "value for title",
        :short => "value for short",
        :description => "value for description",
        :visible => false,
        :active => false,
        :credits => 1,
        :number => 1,
        :user => 1
      )
    ]
  end

  it "renders a list of lectures" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for short".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end


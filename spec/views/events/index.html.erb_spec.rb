require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/events/index.html.erb" do
  include EventsHelper
  
  before(:each) do
    assigns[:events] = [
      stub_model(Event,
        :from_block => 1,
        :to_block => 1,
        :repeatFrequency => "value for repeatFrequency",
        :repeatInterval => 1,
        :lecture => 1,
        :room => 1,
        :is_blocked => false
      ),
      stub_model(Event,
        :from_block => 1,
        :to_block => 1,
        :repeatFrequency => "value for repeatFrequency",
        :repeatInterval => 1,
        :lecture => 1,
        :room => 1,
        :is_blocked => false
      )
    ]
  end

  it "renders a list of events" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for repeatFrequency".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
  end
end


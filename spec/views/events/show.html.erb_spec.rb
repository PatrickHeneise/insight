require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/events/show.html.erb" do
  include EventsHelper
  before(:each) do
    assigns[:event] = @event = stub_model(Event,
      :from_block => 1,
      :to_block => 1,
      :repeatFrequency => "value for repeatFrequency",
      :repeatInterval => 1,
      :lecture => 1,
      :room => 1,
      :is_blocked => false
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ repeatFrequency/)
    response.should have_text(/1/)
    response.should have_text(//)
    response.should have_text(//)
    response.should have_text(/false/)
  end
end


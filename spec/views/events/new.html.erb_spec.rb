require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/events/new.html.erb" do
  include EventsHelper
  
  before(:each) do
    assigns[:event] = stub_model(Event,
      :new_record? => true,
      :from_block => 1,
      :to_block => 1,
      :repeatFrequency => "value for repeatFrequency",
      :repeatInterval => 1,
      :lecture => 1,
      :room => 1,
      :is_blocked => false
    )
  end

  it "renders new event form" do
    render
    
    response.should have_tag("form[action=?][method=post]", events_path) do
      with_tag("input#event_from_block[name=?]", "event[from_block]")
      with_tag("input#event_to_block[name=?]", "event[to_block]")
      with_tag("input#event_repeatFrequency[name=?]", "event[repeatFrequency]")
      with_tag("input#event_repeatInterval[name=?]", "event[repeatInterval]")
      with_tag("input#event_lecture[name=?]", "event[lecture]")
      with_tag("input#event_room[name=?]", "event[room]")
      with_tag("input#event_is_blocked[name=?]", "event[is_blocked]")
    end
  end
end



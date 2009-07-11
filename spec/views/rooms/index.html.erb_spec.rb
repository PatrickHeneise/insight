require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/rooms/index.html.erb" do
  include RoomsHelper
  
  before(:each) do
    assigns[:rooms] = [
      stub_model(Room,
        :number => 1,
        :building => ,
        :user => 
      ),
      stub_model(Room,
        :number => 1,
        :building => ,
        :user => 
      )
    ]
  end

  it "renders a list of rooms" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", .to_s, 2)
    response.should have_tag("tr>td", .to_s, 2)
  end
end


require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/rooms/new.html.erb" do
  include RoomsHelper
  
  before(:each) do
    assigns[:room] = stub_model(Room,
      :new_record? => true,
      :number => 1,
      :building => ,
      :user => 
    )
  end

  it "renders new room form" do
    render
    
    response.should have_tag("form[action=?][method=post]", rooms_path) do
      with_tag("input#room_number[name=?]", "room[number]")
      with_tag("input#room_building[name=?]", "room[building]")
      with_tag("input#room_user[name=?]", "room[user]")
    end
  end
end



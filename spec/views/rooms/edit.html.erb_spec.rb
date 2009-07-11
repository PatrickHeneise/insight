require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/rooms/edit.html.erb" do
  include RoomsHelper
  
  before(:each) do
    assigns[:room] = @room = stub_model(Room,
      :new_record? => false,
      :number => 1,
      :building => ,
      :user => 
    )
  end

  it "renders the edit room form" do
    render
    
    response.should have_tag("form[action=#{room_path(@room)}][method=post]") do
      with_tag('input#room_number[name=?]', "room[number]")
      with_tag('input#room_building[name=?]', "room[building]")
      with_tag('input#room_user[name=?]', "room[user]")
    end
  end
end



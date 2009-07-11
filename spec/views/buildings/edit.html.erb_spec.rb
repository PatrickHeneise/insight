require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/buildings/edit.html.erb" do
  include BuildingsHelper
  
  before(:each) do
    assigns[:building] = @building = stub_model(Building,
      :new_record? => false,
      :code => "value for code",
      :address => ,
      :organization => ,
      :info => "value for info"
    )
  end

  it "renders the edit building form" do
    render
    
    response.should have_tag("form[action=#{building_path(@building)}][method=post]") do
      with_tag('input#building_code[name=?]', "building[code]")
      with_tag('input#building_address[name=?]', "building[address]")
      with_tag('input#building_organization[name=?]', "building[organization]")
      with_tag('textarea#building_info[name=?]', "building[info]")
    end
  end
end



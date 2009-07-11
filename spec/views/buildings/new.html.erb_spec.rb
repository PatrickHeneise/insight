require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/buildings/new.html.erb" do
  include BuildingsHelper
  
  before(:each) do
    assigns[:building] = stub_model(Building,
      :new_record? => true,
      :code => "value for code",
      :address => ,
      :organization => ,
      :info => "value for info"
    )
  end

  it "renders new building form" do
    render
    
    response.should have_tag("form[action=?][method=post]", buildings_path) do
      with_tag("input#building_code[name=?]", "building[code]")
      with_tag("input#building_address[name=?]", "building[address]")
      with_tag("input#building_organization[name=?]", "building[organization]")
      with_tag("textarea#building_info[name=?]", "building[info]")
    end
  end
end



require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/addresses/edit.html.erb" do
  include AddressesHelper
  
  before(:each) do
    assigns[:address] = @address = stub_model(Address,
      :new_record? => false,
      :street => "value for street",
      :street_addition => "value for street_addition",
      :city => "value for city",
      :postcode => "value for postcode",
      :state => "value for state",
      :country => "value for country"
    )
  end

  it "renders the edit address form" do
    render
    
    response.should have_tag("form[action=#{address_path(@address)}][method=post]") do
      with_tag('input#address_street[name=?]', "address[street]")
      with_tag('input#address_street_addition[name=?]', "address[street_addition]")
      with_tag('input#address_city[name=?]', "address[city]")
      with_tag('input#address_postcode[name=?]', "address[postcode]")
      with_tag('input#address_state[name=?]', "address[state]")
      with_tag('input#address_country[name=?]', "address[country]")
    end
  end
end



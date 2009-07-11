require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/addresses/index.html.erb" do
  include AddressesHelper
  
  before(:each) do
    assigns[:addresses] = [
      stub_model(Address,
        :street => "value for street",
        :street_addition => "value for street_addition",
        :city => "value for city",
        :postcode => "value for postcode",
        :state => "value for state",
        :country => "value for country"
      ),
      stub_model(Address,
        :street => "value for street",
        :street_addition => "value for street_addition",
        :city => "value for city",
        :postcode => "value for postcode",
        :state => "value for state",
        :country => "value for country"
      )
    ]
  end

  it "renders a list of addresses" do
    render
    response.should have_tag("tr>td", "value for street".to_s, 2)
    response.should have_tag("tr>td", "value for street_addition".to_s, 2)
    response.should have_tag("tr>td", "value for city".to_s, 2)
    response.should have_tag("tr>td", "value for postcode".to_s, 2)
    response.should have_tag("tr>td", "value for state".to_s, 2)
    response.should have_tag("tr>td", "value for country".to_s, 2)
  end
end


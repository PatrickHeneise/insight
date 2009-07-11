require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/addresses/show.html.erb" do
  include AddressesHelper
  before(:each) do
    assigns[:address] = @address = stub_model(Address,
      :street => "value for street",
      :street_addition => "value for street_addition",
      :city => "value for city",
      :postcode => "value for postcode",
      :state => "value for state",
      :country => "value for country"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ street/)
    response.should have_text(/value\ for\ street_addition/)
    response.should have_text(/value\ for\ city/)
    response.should have_text(/value\ for\ postcode/)
    response.should have_text(/value\ for\ state/)
    response.should have_text(/value\ for\ country/)
  end
end


require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/companies/show.html.erb" do
  include CompaniesHelper
  before(:each) do
    assigns[:company] = @company = stub_model(Company,
      :name => "value for name",
      :address => 1,
      :industry => "value for industry"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(//)
    response.should have_text(/value\ for\ industry/)
  end
end


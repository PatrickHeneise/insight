require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/companies/index.html.erb" do
  include CompaniesHelper
  
  before(:each) do
    assigns[:companies] = [
      stub_model(Company,
        :name => "value for name",
        :address => 1,
        :industry => "value for industry"
      ),
      stub_model(Company,
        :name => "value for name",
        :address => 1,
        :industry => "value for industry"
      )
    ]
  end

  it "renders a list of companies" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for industry".to_s, 2)
  end
end


require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/companies/new.html.erb" do
  include CompaniesHelper
  
  before(:each) do
    assigns[:company] = stub_model(Company,
      :new_record? => true,
      :name => "value for name",
      :address => 1,
      :industry => "value for industry"
    )
  end

  it "renders new company form" do
    render
    
    response.should have_tag("form[action=?][method=post]", companies_path) do
      with_tag("input#company_name[name=?]", "company[name]")
      with_tag("input#company_address[name=?]", "company[address]")
      with_tag("input#company_industry[name=?]", "company[industry]")
    end
  end
end



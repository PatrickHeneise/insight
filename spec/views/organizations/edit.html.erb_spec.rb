require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/organizations/edit.html.erb" do
  include OrganizationsHelper
  
  before(:each) do
    assigns[:organization] = @organization = stub_model(Organization,
      :new_record? => false,
      :title => "value for title"
    )
  end

  it "renders the edit organization form" do
    render
    
    response.should have_tag("form[action=#{organization_path(@organization)}][method=post]") do
      with_tag('input#organization_title[name=?]', "organization[title]")
    end
  end
end



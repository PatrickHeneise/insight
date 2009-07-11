require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/organizations/show.html.erb" do
  include OrganizationsHelper
  before(:each) do
    assigns[:organization] = @organization = stub_model(Organization,
      :title => "value for title"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title/)
  end
end


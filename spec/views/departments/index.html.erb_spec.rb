require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/departments/index.html.erb" do
  include DepartmentsHelper
  
  before(:each) do
    assigns[:departments] = [
      stub_model(Department,
        :title => "value for title",
        :description => "value for description",
        :organization => 1
      ),
      stub_model(Department,
        :title => "value for title",
        :description => "value for description",
        :organization => 1
      )
    ]
  end

  it "renders a list of departments" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end


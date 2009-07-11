require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/departments/edit.html.erb" do
  include DepartmentsHelper
  
  before(:each) do
    assigns[:department] = @department = stub_model(Department,
      :new_record? => false,
      :title => "value for title",
      :description => "value for description",
      :organization => 1
    )
  end

  it "renders the edit department form" do
    render
    
    response.should have_tag("form[action=#{department_path(@department)}][method=post]") do
      with_tag('input#department_title[name=?]', "department[title]")
      with_tag('textarea#department_description[name=?]', "department[description]")
      with_tag('input#department_organization[name=?]', "department[organization]")
    end
  end
end



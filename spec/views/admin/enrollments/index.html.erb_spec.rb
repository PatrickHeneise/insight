require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')

describe "/admin_enrollments/index.html.erb" do
  include Admin::EnrollmentsHelper

  before(:each) do
    assigns[:admin_enrollments] = [
      stub_model(Admin::Enrollments),
      stub_model(Admin::Enrollments)
    ]
  end

  it "renders a list of admin_enrollments" do
    render
  end
end

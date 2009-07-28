require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')

describe "/admin_enrollments/show.html.erb" do
  include Admin::EnrollmentsHelper
  before(:each) do
    assigns[:enrollments] = @enrollments = stub_model(Admin::Enrollments)
  end

  it "renders attributes in <p>" do
    render
  end
end

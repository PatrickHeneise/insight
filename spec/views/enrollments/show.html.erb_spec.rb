require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/enrollments/show.html.erb" do
  include EnrollmentsHelper
  before(:each) do
    assigns[:enrollments] = @enrollments = stub_model(Enrollments)
  end

  it "renders attributes in <p>" do
    render
  end
end

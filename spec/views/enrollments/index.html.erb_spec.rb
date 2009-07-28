require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/enrollments/index.html.erb" do
  include EnrollmentsHelper

  before(:each) do
    assigns[:enrollments] = [
      stub_model(Enrollments),
      stub_model(Enrollments)
    ]
  end

  it "renders a list of enrollments" do
    render
  end
end

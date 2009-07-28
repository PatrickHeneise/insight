require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')

describe "/admin_enrollments/new.html.erb" do
  include Admin::EnrollmentsHelper

  before(:each) do
    assigns[:enrollments] = stub_model(Admin::Enrollments,
      :new_record? => true
    )
  end

  it "renders new enrollments form" do
    render

    response.should have_tag("form[action=?][method=post]", admin_enrollments_path) do
    end
  end
end

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/enrollments/new.html.erb" do
  include EnrollmentsHelper

  before(:each) do
    assigns[:enrollments] = stub_model(Enrollments,
      :new_record? => true
    )
  end

  it "renders new enrollments form" do
    render

    response.should have_tag("form[action=?][method=post]", enrollments_path) do
    end
  end
end

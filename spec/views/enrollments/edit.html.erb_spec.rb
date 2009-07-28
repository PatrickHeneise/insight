require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/enrollments/edit.html.erb" do
  include EnrollmentsHelper

  before(:each) do
    assigns[:enrollments] = @enrollments = stub_model(Enrollments,
      :new_record? => false
    )
  end

  it "renders the edit enrollments form" do
    render

    response.should have_tag("form[action=#{enrollments_path(@enrollments)}][method=post]") do
    end
  end
end

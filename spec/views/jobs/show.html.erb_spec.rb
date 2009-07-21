require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/jobs/show.html.erb" do
  include JobsHelper
  before(:each) do
    assigns[:jobs] = @jobs = stub_model(Jobs,
      :company => 1,
      :user => 1,
      :title => "value for title",
      :description => "value for description",
      :prerequisit => "value for prerequisit",
      :period => "value for period",
      :payment => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(/value\ for\ prerequisit/)
    response.should have_text(/value\ for\ period/)
    response.should have_text(/1/)
  end
end

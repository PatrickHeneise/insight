require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/jobs/index.html.erb" do
  include JobsHelper

  before(:each) do
    assigns[:jobs] = [
      stub_model(Jobs,
        :company => 1,
        :user => 1,
        :title => "value for title",
        :description => "value for description",
        :prerequisit => "value for prerequisit",
        :period => "value for period",
        :payment => 1
      ),
      stub_model(Jobs,
        :company => 1,
        :user => 1,
        :title => "value for title",
        :description => "value for description",
        :prerequisit => "value for prerequisit",
        :period => "value for period",
        :payment => 1
      )
    ]
  end

  it "renders a list of jobs" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", "value for prerequisit".to_s, 2)
    response.should have_tag("tr>td", "value for period".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

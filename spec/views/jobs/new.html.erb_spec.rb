require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/jobs/new.html.erb" do
  include JobsHelper

  before(:each) do
    assigns[:jobs] = stub_model(Jobs,
      :new_record? => true,
      :company => 1,
      :user => 1,
      :title => "value for title",
      :description => "value for description",
      :prerequisit => "value for prerequisit",
      :period => "value for period",
      :payment => 1
    )
  end

  it "renders new jobs form" do
    render

    response.should have_tag("form[action=?][method=post]", jobs_path) do
      with_tag("input#jobs_company[name=?]", "jobs[company]")
      with_tag("input#jobs_user[name=?]", "jobs[user]")
      with_tag("input#jobs_title[name=?]", "jobs[title]")
      with_tag("textarea#jobs_description[name=?]", "jobs[description]")
      with_tag("textarea#jobs_prerequisit[name=?]", "jobs[prerequisit]")
      with_tag("input#jobs_period[name=?]", "jobs[period]")
      with_tag("input#jobs_payment[name=?]", "jobs[payment]")
    end
  end
end

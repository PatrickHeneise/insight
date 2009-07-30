require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/theses/index.html.erb" do
  include ThesesHelper

  before(:each) do
    assigns[:theses] = [
      stub_model(Thesis,
        :editor => 1,
        :coeditor => 1,
        :course => 1,
        :topic => "value for topic",
        :supervisor => 1,
        :assistant_supervisor => 1,
        :state => "value for state",
        :abstract => "value for abstract",
        :url => "value for url"
      ),
      stub_model(Thesis,
        :editor => 1,
        :coeditor => 1,
        :course => 1,
        :topic => "value for topic",
        :supervisor => 1,
        :assistant_supervisor => 1,
        :state => "value for state",
        :abstract => "value for abstract",
        :url => "value for url"
      )
    ]
  end

  it "renders a list of theses" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for topic".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for state".to_s, 2)
    response.should have_tag("tr>td", "value for abstract".to_s, 2)
    response.should have_tag("tr>td", "value for url".to_s, 2)
  end
end

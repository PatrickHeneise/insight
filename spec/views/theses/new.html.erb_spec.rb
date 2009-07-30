require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/theses/new.html.erb" do
  include ThesesHelper

  before(:each) do
    assigns[:thesis] = stub_model(Thesis,
      :new_record? => true,
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
  end

  it "renders new thesis form" do
    render

    response.should have_tag("form[action=?][method=post]", theses_path) do
      with_tag("input#thesis_editor[name=?]", "thesis[editor]")
      with_tag("input#thesis_coeditor[name=?]", "thesis[coeditor]")
      with_tag("input#thesis_course[name=?]", "thesis[course]")
      with_tag("input#thesis_topic[name=?]", "thesis[topic]")
      with_tag("input#thesis_supervisor[name=?]", "thesis[supervisor]")
      with_tag("input#thesis_assistant_supervisor[name=?]", "thesis[assistant_supervisor]")
      with_tag("input#thesis_state[name=?]", "thesis[state]")
      with_tag("textarea#thesis_abstract[name=?]", "thesis[abstract]")
      with_tag("input#thesis_url[name=?]", "thesis[url]")
    end
  end
end

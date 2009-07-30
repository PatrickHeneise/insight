require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/theses/show.html.erb" do
  include ThesesHelper
  before(:each) do
    assigns[:thesis] = @thesis = stub_model(Thesis,
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

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ topic/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ state/)
    response.should have_text(/value\ for\ abstract/)
    response.should have_text(/value\ for\ url/)
  end
end

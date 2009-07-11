require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/forums/show.html.erb" do
  include ForumsHelper
  before(:each) do
    assigns[:forum] = @forum = stub_model(Forum,
      :title => "value for title",
      :unit => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title/)
    response.should have_text(//)
  end
end


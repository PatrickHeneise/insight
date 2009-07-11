require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/lectures/show.html.erb" do
  include LecturesHelper
  before(:each) do
    assigns[:lecture] = @lecture = stub_model(Lecture,
      :unit => 1,
      :title => "value for title",
      :short => "value for short",
      :description => "value for description",
      :visible => false,
      :active => false,
      :credits => 1,
      :number => 1,
      :user => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(//)
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ short/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(/false/)
    response.should have_text(/false/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(//)
  end
end


require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/bullets/show.html.erb" do
  include BulletsHelper
  before(:each) do
    assigns[:bullet] = @bullet = stub_model(Bullet,
      :board => 1,
      :title => "value for title",
      :content => "value for content",
      :user => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(//)
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ content/)
    response.should have_text(//)
  end
end


require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/buildings/show.html.erb" do
  include BuildingsHelper
  before(:each) do
    assigns[:building] = @building = stub_model(Building,
      :code => "value for code",
      :address => ,
      :organization => ,
      :info => "value for info"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ code/)
    response.should have_text(//)
    response.should have_text(//)
    response.should have_text(/value\ for\ info/)
  end
end


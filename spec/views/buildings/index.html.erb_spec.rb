require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/buildings/index.html.erb" do
  include BuildingsHelper
  
  before(:each) do
    assigns[:buildings] = [
      stub_model(Building,
        :code => "value for code",
        :address => ,
        :organization => ,
        :info => "value for info"
      ),
      stub_model(Building,
        :code => "value for code",
        :address => ,
        :organization => ,
        :info => "value for info"
      )
    ]
  end

  it "renders a list of buildings" do
    render
    response.should have_tag("tr>td", "value for code".to_s, 2)
    response.should have_tag("tr>td", .to_s, 2)
    response.should have_tag("tr>td", .to_s, 2)
    response.should have_tag("tr>td", "value for info".to_s, 2)
  end
end


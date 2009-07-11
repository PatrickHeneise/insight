require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/boards/index.html.erb" do
  include BoardsHelper
  
  before(:each) do
    assigns[:boards] = [
      stub_model(Board,
        :lecture => 1
      ),
      stub_model(Board,
        :lecture => 1
      )
    ]
  end

  it "renders a list of boards" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end


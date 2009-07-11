require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/boards/show.html.erb" do
  include BoardsHelper
  before(:each) do
    assigns[:board] = @board = stub_model(Board,
      :lecture => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(//)
  end
end


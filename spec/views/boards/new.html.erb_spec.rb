require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/boards/new.html.erb" do
  include BoardsHelper
  
  before(:each) do
    assigns[:board] = stub_model(Board,
      :new_record? => true,
      :lecture => 1
    )
  end

  it "renders new board form" do
    render
    
    response.should have_tag("form[action=?][method=post]", boards_path) do
      with_tag("input#board_lecture[name=?]", "board[lecture]")
    end
  end
end



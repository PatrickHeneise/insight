require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/boards/edit.html.erb" do
  include BoardsHelper
  
  before(:each) do
    assigns[:board] = @board = stub_model(Board,
      :new_record? => false,
      :lecture => 1
    )
  end

  it "renders the edit board form" do
    render
    
    response.should have_tag("form[action=#{board_path(@board)}][method=post]") do
      with_tag('input#board_lecture[name=?]', "board[lecture]")
    end
  end
end



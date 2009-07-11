require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/bullets/edit.html.erb" do
  include BulletsHelper
  
  before(:each) do
    assigns[:bullet] = @bullet = stub_model(Bullet,
      :new_record? => false,
      :board => 1,
      :title => "value for title",
      :content => "value for content",
      :user => 1
    )
  end

  it "renders the edit bullet form" do
    render
    
    response.should have_tag("form[action=#{bullet_path(@bullet)}][method=post]") do
      with_tag('input#bullet_board[name=?]', "bullet[board]")
      with_tag('input#bullet_title[name=?]', "bullet[title]")
      with_tag('textarea#bullet_content[name=?]', "bullet[content]")
      with_tag('input#bullet_user[name=?]', "bullet[user]")
    end
  end
end



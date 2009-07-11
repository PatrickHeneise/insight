module AuthenticationSpecHelper

  def guest_mode
    controller.instance_variable_set(:@current_account, nil)
  end

  def user_mode
    user = mock_model(User)
    controller.instance_variable_set(:@current_account, user)
    user
  end

end

#
# Usage
#

describe UsersController, "edit action" do

  before(:each) do
    @logged_in_account = user_mode
    @account = mock_model(Account)
  end

  it "should redirect guest to login page" do
    guest_mode

    get :edit, :id => 1

    response.should be_redirect
    response.should redirect_to(new_session_path)
  end

  it "should redirect to login page if user tries to access another user account" do
    get :edit, :id => @logged_in_account.id + 1

    response.should be_redirect
    response.should redirect_to(new_session_path)
  end
  
  it "should find account, assign account and render account profile form" do
    Account.should_receive(:find).with(@logged_in_account.id.to_s).and_return(@account)

    get :edit, :id => @logged_in_account.id

    assigns[:account].should == @account
    response.should be_success
    response.should render_template('accounts/edit')
    response.layout.should == 'layouts/application'
  end
end
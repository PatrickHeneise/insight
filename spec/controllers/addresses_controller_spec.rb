require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AddressesController do

  def mock_address(stubs={})
    @mock_address ||= mock_model(Address, stubs)
  end
  
  describe "GET index" do
    it "assigns all addresses as @addresses" do
      Address.should_receive(:find).with(:all).and_return([mock_address])
      get :index
      assigns[:addresses].should == [mock_address]
    end
  end

  describe "GET show" do
    it "assigns the requested address as @address" do
      Address.should_receive(:find).with("37").and_return(mock_address)
      get :show, :id => "37"
      assigns[:address].should equal(mock_address)
    end
  end

  describe "GET new" do
    it "assigns a new address as @address" do
      Address.should_receive(:new).and_return(mock_address)
      get :new
      assigns[:address].should equal(mock_address)
    end
  end

  describe "GET edit" do
    it "assigns the requested address as @address" do
      Address.should_receive(:find).with("37").and_return(mock_address)
      get :edit, :id => "37"
      assigns[:address].should equal(mock_address)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created address as @address" do
        Address.should_receive(:new).with({'these' => 'params'}).and_return(mock_address(:save => true))
        post :create, :address => {:these => 'params'}
        assigns[:address].should equal(mock_address)
      end

      it "redirects to the created address" do
        Address.stub!(:new).and_return(mock_address(:save => true))
        post :create, :address => {}
        response.should redirect_to(address_url(mock_address))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved address as @address" do
        Address.stub!(:new).with({'these' => 'params'}).and_return(mock_address(:save => false))
        post :create, :address => {:these => 'params'}
        assigns[:address].should equal(mock_address)
      end

      it "re-renders the 'new' template" do
        Address.stub!(:new).and_return(mock_address(:save => false))
        post :create, :address => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT udpate" do
    
    describe "with valid params" do
      it "updates the requested address" do
        Address.should_receive(:find).with("37").and_return(mock_address)
        mock_address.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :address => {:these => 'params'}
      end

      it "assigns the requested address as @address" do
        Address.stub!(:find).and_return(mock_address(:update_attributes => true))
        put :update, :id => "1"
        assigns[:address].should equal(mock_address)
      end

      it "redirects to the address" do
        Address.stub!(:find).and_return(mock_address(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(address_url(mock_address))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested address" do
        Address.should_receive(:find).with("37").and_return(mock_address)
        mock_address.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :address => {:these => 'params'}
      end

      it "assigns the address as @address" do
        Address.stub!(:find).and_return(mock_address(:update_attributes => false))
        put :update, :id => "1"
        assigns[:address].should equal(mock_address)
      end

      it "re-renders the 'edit' template" do
        Address.stub!(:find).and_return(mock_address(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested address" do
      Address.should_receive(:find).with("37").and_return(mock_address)
      mock_address.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the addresses list" do
      Address.stub!(:find).and_return(mock_address(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(addresses_url)
    end
  end

end

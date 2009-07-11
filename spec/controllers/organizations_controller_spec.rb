require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OrganizationsController do

  def mock_organization(stubs={})
    @mock_organization ||= mock_model(Organization, stubs)
  end
  
  describe "GET index" do
    it "assigns all organizations as @organizations" do
      Organization.should_receive(:find).with(:all).and_return([mock_organization])
      get :index
      assigns[:organizations].should == [mock_organization]
    end
  end

  describe "GET show" do
    it "assigns the requested organization as @organization" do
      Organization.should_receive(:find).with("37").and_return(mock_organization)
      get :show, :id => "37"
      assigns[:organization].should equal(mock_organization)
    end
  end

  describe "GET new" do
    it "assigns a new organization as @organization" do
      Organization.should_receive(:new).and_return(mock_organization)
      get :new
      assigns[:organization].should equal(mock_organization)
    end
  end

  describe "GET edit" do
    it "assigns the requested organization as @organization" do
      Organization.should_receive(:find).with("37").and_return(mock_organization)
      get :edit, :id => "37"
      assigns[:organization].should equal(mock_organization)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created organization as @organization" do
        Organization.should_receive(:new).with({'these' => 'params'}).and_return(mock_organization(:save => true))
        post :create, :organization => {:these => 'params'}
        assigns[:organization].should equal(mock_organization)
      end

      it "redirects to the created organization" do
        Organization.stub!(:new).and_return(mock_organization(:save => true))
        post :create, :organization => {}
        response.should redirect_to(organization_url(mock_organization))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved organization as @organization" do
        Organization.stub!(:new).with({'these' => 'params'}).and_return(mock_organization(:save => false))
        post :create, :organization => {:these => 'params'}
        assigns[:organization].should equal(mock_organization)
      end

      it "re-renders the 'new' template" do
        Organization.stub!(:new).and_return(mock_organization(:save => false))
        post :create, :organization => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT udpate" do
    
    describe "with valid params" do
      it "updates the requested organization" do
        Organization.should_receive(:find).with("37").and_return(mock_organization)
        mock_organization.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :organization => {:these => 'params'}
      end

      it "assigns the requested organization as @organization" do
        Organization.stub!(:find).and_return(mock_organization(:update_attributes => true))
        put :update, :id => "1"
        assigns[:organization].should equal(mock_organization)
      end

      it "redirects to the organization" do
        Organization.stub!(:find).and_return(mock_organization(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(organization_url(mock_organization))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested organization" do
        Organization.should_receive(:find).with("37").and_return(mock_organization)
        mock_organization.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :organization => {:these => 'params'}
      end

      it "assigns the organization as @organization" do
        Organization.stub!(:find).and_return(mock_organization(:update_attributes => false))
        put :update, :id => "1"
        assigns[:organization].should equal(mock_organization)
      end

      it "re-renders the 'edit' template" do
        Organization.stub!(:find).and_return(mock_organization(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested organization" do
      Organization.should_receive(:find).with("37").and_return(mock_organization)
      mock_organization.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the organizations list" do
      Organization.stub!(:find).and_return(mock_organization(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(organizations_url)
    end
  end

end

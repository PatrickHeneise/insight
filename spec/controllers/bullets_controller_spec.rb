require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BulletsController do

  def mock_bullet(stubs={})
    @mock_bullet ||= mock_model(Bullet, stubs)
  end
  
  describe "GET index" do
    it "assigns all bullets as @bullets" do
      Bullet.stub!(:find).with(:all).and_return([mock_bullet])
      get :index
      assigns[:bullets].should == [mock_bullet]
    end
  end

  describe "GET show" do
    it "assigns the requested bullet as @bullet" do
      Bullet.stub!(:find).with("37").and_return(mock_bullet)
      get :show, :id => "37"
      assigns[:bullet].should equal(mock_bullet)
    end
  end

  describe "GET new" do
    it "assigns a new bullet as @bullet" do
      Bullet.stub!(:new).and_return(mock_bullet)
      get :new
      assigns[:bullet].should equal(mock_bullet)
    end
  end

  describe "GET edit" do
    it "assigns the requested bullet as @bullet" do
      Bullet.stub!(:find).with("37").and_return(mock_bullet)
      get :edit, :id => "37"
      assigns[:bullet].should equal(mock_bullet)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created bullet as @bullet" do
        Bullet.stub!(:new).with({'these' => 'params'}).and_return(mock_bullet(:save => true))
        post :create, :bullet => {:these => 'params'}
        assigns[:bullet].should equal(mock_bullet)
      end

      it "redirects to the created bullet" do
        Bullet.stub!(:new).and_return(mock_bullet(:save => true))
        post :create, :bullet => {}
        response.should redirect_to(bullet_url(mock_bullet))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved bullet as @bullet" do
        Bullet.stub!(:new).with({'these' => 'params'}).and_return(mock_bullet(:save => false))
        post :create, :bullet => {:these => 'params'}
        assigns[:bullet].should equal(mock_bullet)
      end

      it "re-renders the 'new' template" do
        Bullet.stub!(:new).and_return(mock_bullet(:save => false))
        post :create, :bullet => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested bullet" do
        Bullet.should_receive(:find).with("37").and_return(mock_bullet)
        mock_bullet.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :bullet => {:these => 'params'}
      end

      it "assigns the requested bullet as @bullet" do
        Bullet.stub!(:find).and_return(mock_bullet(:update_attributes => true))
        put :update, :id => "1"
        assigns[:bullet].should equal(mock_bullet)
      end

      it "redirects to the bullet" do
        Bullet.stub!(:find).and_return(mock_bullet(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(bullet_url(mock_bullet))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested bullet" do
        Bullet.should_receive(:find).with("37").and_return(mock_bullet)
        mock_bullet.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :bullet => {:these => 'params'}
      end

      it "assigns the bullet as @bullet" do
        Bullet.stub!(:find).and_return(mock_bullet(:update_attributes => false))
        put :update, :id => "1"
        assigns[:bullet].should equal(mock_bullet)
      end

      it "re-renders the 'edit' template" do
        Bullet.stub!(:find).and_return(mock_bullet(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested bullet" do
      Bullet.should_receive(:find).with("37").and_return(mock_bullet)
      mock_bullet.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the bullets list" do
      Bullet.stub!(:find).and_return(mock_bullet(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(bullets_url)
    end
  end

end

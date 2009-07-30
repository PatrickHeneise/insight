require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ThesesController do

  def mock_thesis(stubs={})
    @mock_thesis ||= mock_model(Thesis, stubs)
  end

  describe "GET index" do
    it "assigns all theses as @theses" do
      Thesis.stub!(:find).with(:all).and_return([mock_thesis])
      get :index
      assigns[:theses].should == [mock_thesis]
    end
  end

  describe "GET show" do
    it "assigns the requested thesis as @thesis" do
      Thesis.stub!(:find).with("37").and_return(mock_thesis)
      get :show, :id => "37"
      assigns[:thesis].should equal(mock_thesis)
    end
  end

  describe "GET new" do
    it "assigns a new thesis as @thesis" do
      Thesis.stub!(:new).and_return(mock_thesis)
      get :new
      assigns[:thesis].should equal(mock_thesis)
    end
  end

  describe "GET edit" do
    it "assigns the requested thesis as @thesis" do
      Thesis.stub!(:find).with("37").and_return(mock_thesis)
      get :edit, :id => "37"
      assigns[:thesis].should equal(mock_thesis)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created thesis as @thesis" do
        Thesis.stub!(:new).with({'these' => 'params'}).and_return(mock_thesis(:save => true))
        post :create, :thesis => {:these => 'params'}
        assigns[:thesis].should equal(mock_thesis)
      end

      it "redirects to the created thesis" do
        Thesis.stub!(:new).and_return(mock_thesis(:save => true))
        post :create, :thesis => {}
        response.should redirect_to(thesis_url(mock_thesis))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved thesis as @thesis" do
        Thesis.stub!(:new).with({'these' => 'params'}).and_return(mock_thesis(:save => false))
        post :create, :thesis => {:these => 'params'}
        assigns[:thesis].should equal(mock_thesis)
      end

      it "re-renders the 'new' template" do
        Thesis.stub!(:new).and_return(mock_thesis(:save => false))
        post :create, :thesis => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested thesis" do
        Thesis.should_receive(:find).with("37").and_return(mock_thesis)
        mock_thesis.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :thesis => {:these => 'params'}
      end

      it "assigns the requested thesis as @thesis" do
        Thesis.stub!(:find).and_return(mock_thesis(:update_attributes => true))
        put :update, :id => "1"
        assigns[:thesis].should equal(mock_thesis)
      end

      it "redirects to the thesis" do
        Thesis.stub!(:find).and_return(mock_thesis(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(thesis_url(mock_thesis))
      end
    end

    describe "with invalid params" do
      it "updates the requested thesis" do
        Thesis.should_receive(:find).with("37").and_return(mock_thesis)
        mock_thesis.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :thesis => {:these => 'params'}
      end

      it "assigns the thesis as @thesis" do
        Thesis.stub!(:find).and_return(mock_thesis(:update_attributes => false))
        put :update, :id => "1"
        assigns[:thesis].should equal(mock_thesis)
      end

      it "re-renders the 'edit' template" do
        Thesis.stub!(:find).and_return(mock_thesis(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested thesis" do
      Thesis.should_receive(:find).with("37").and_return(mock_thesis)
      mock_thesis.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the theses list" do
      Thesis.stub!(:find).and_return(mock_thesis(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(theses_url)
    end
  end

end

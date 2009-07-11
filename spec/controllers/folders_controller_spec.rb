require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FoldersController do

  def mock_folder(stubs={})
    @mock_folder ||= mock_model(Folder, stubs)
  end
  
  describe "GET index" do
    it "assigns all folders as @folders" do
      Folder.stub!(:find).with(:all).and_return([mock_folder])
      get :index
      assigns[:folders].should == [mock_folder]
    end
  end

  describe "GET show" do
    it "assigns the requested folder as @folder" do
      Folder.stub!(:find).with("37").and_return(mock_folder)
      get :show, :id => "37"
      assigns[:folder].should equal(mock_folder)
    end
  end

  describe "GET new" do
    it "assigns a new folder as @folder" do
      Folder.stub!(:new).and_return(mock_folder)
      get :new
      assigns[:folder].should equal(mock_folder)
    end
  end

  describe "GET edit" do
    it "assigns the requested folder as @folder" do
      Folder.stub!(:find).with("37").and_return(mock_folder)
      get :edit, :id => "37"
      assigns[:folder].should equal(mock_folder)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created folder as @folder" do
        Folder.stub!(:new).with({'these' => 'params'}).and_return(mock_folder(:save => true))
        post :create, :folder => {:these => 'params'}
        assigns[:folder].should equal(mock_folder)
      end

      it "redirects to the created folder" do
        Folder.stub!(:new).and_return(mock_folder(:save => true))
        post :create, :folder => {}
        response.should redirect_to(folder_url(mock_folder))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved folder as @folder" do
        Folder.stub!(:new).with({'these' => 'params'}).and_return(mock_folder(:save => false))
        post :create, :folder => {:these => 'params'}
        assigns[:folder].should equal(mock_folder)
      end

      it "re-renders the 'new' template" do
        Folder.stub!(:new).and_return(mock_folder(:save => false))
        post :create, :folder => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested folder" do
        Folder.should_receive(:find).with("37").and_return(mock_folder)
        mock_folder.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :folder => {:these => 'params'}
      end

      it "assigns the requested folder as @folder" do
        Folder.stub!(:find).and_return(mock_folder(:update_attributes => true))
        put :update, :id => "1"
        assigns[:folder].should equal(mock_folder)
      end

      it "redirects to the folder" do
        Folder.stub!(:find).and_return(mock_folder(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(folder_url(mock_folder))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested folder" do
        Folder.should_receive(:find).with("37").and_return(mock_folder)
        mock_folder.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :folder => {:these => 'params'}
      end

      it "assigns the folder as @folder" do
        Folder.stub!(:find).and_return(mock_folder(:update_attributes => false))
        put :update, :id => "1"
        assigns[:folder].should equal(mock_folder)
      end

      it "re-renders the 'edit' template" do
        Folder.stub!(:find).and_return(mock_folder(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested folder" do
      Folder.should_receive(:find).with("37").and_return(mock_folder)
      mock_folder.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the folders list" do
      Folder.stub!(:find).and_return(mock_folder(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(folders_url)
    end
  end

end

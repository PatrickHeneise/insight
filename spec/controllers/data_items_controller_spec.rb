require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DataItemsController do

  def mock_data_item(stubs={})
    @mock_data_item ||= mock_model(DataItem, stubs)
  end
  
  describe "GET index" do
    it "assigns all data_items as @data_items" do
      DataItem.stub!(:find).with(:all).and_return([mock_data_item])
      get :index
      assigns[:data_items].should == [mock_data_item]
    end
  end

  describe "GET show" do
    it "assigns the requested data_item as @data_item" do
      DataItem.stub!(:find).with("37").and_return(mock_data_item)
      get :show, :id => "37"
      assigns[:data_item].should equal(mock_data_item)
    end
  end

  describe "GET new" do
    it "assigns a new data_item as @data_item" do
      DataItem.stub!(:new).and_return(mock_data_item)
      get :new
      assigns[:data_item].should equal(mock_data_item)
    end
  end

  describe "GET edit" do
    it "assigns the requested data_item as @data_item" do
      DataItem.stub!(:find).with("37").and_return(mock_data_item)
      get :edit, :id => "37"
      assigns[:data_item].should equal(mock_data_item)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created data_item as @data_item" do
        DataItem.stub!(:new).with({'these' => 'params'}).and_return(mock_data_item(:save => true))
        post :create, :data_item => {:these => 'params'}
        assigns[:data_item].should equal(mock_data_item)
      end

      it "redirects to the created data_item" do
        DataItem.stub!(:new).and_return(mock_data_item(:save => true))
        post :create, :data_item => {}
        response.should redirect_to(data_item_url(mock_data_item))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved data_item as @data_item" do
        DataItem.stub!(:new).with({'these' => 'params'}).and_return(mock_data_item(:save => false))
        post :create, :data_item => {:these => 'params'}
        assigns[:data_item].should equal(mock_data_item)
      end

      it "re-renders the 'new' template" do
        DataItem.stub!(:new).and_return(mock_data_item(:save => false))
        post :create, :data_item => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested data_item" do
        DataItem.should_receive(:find).with("37").and_return(mock_data_item)
        mock_data_item.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :data_item => {:these => 'params'}
      end

      it "assigns the requested data_item as @data_item" do
        DataItem.stub!(:find).and_return(mock_data_item(:update_attributes => true))
        put :update, :id => "1"
        assigns[:data_item].should equal(mock_data_item)
      end

      it "redirects to the data_item" do
        DataItem.stub!(:find).and_return(mock_data_item(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(data_item_url(mock_data_item))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested data_item" do
        DataItem.should_receive(:find).with("37").and_return(mock_data_item)
        mock_data_item.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :data_item => {:these => 'params'}
      end

      it "assigns the data_item as @data_item" do
        DataItem.stub!(:find).and_return(mock_data_item(:update_attributes => false))
        put :update, :id => "1"
        assigns[:data_item].should equal(mock_data_item)
      end

      it "re-renders the 'edit' template" do
        DataItem.stub!(:find).and_return(mock_data_item(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested data_item" do
      DataItem.should_receive(:find).with("37").and_return(mock_data_item)
      mock_data_item.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the data_items list" do
      DataItem.stub!(:find).and_return(mock_data_item(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(data_items_url)
    end
  end

end

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RepliesController do

  def mock_reply(stubs={})
    @mock_reply ||= mock_model(Reply, stubs)
  end
  
  describe "GET index" do
    it "assigns all replies as @replies" do
      Reply.stub!(:find).with(:all).and_return([mock_reply])
      get :index
      assigns[:replies].should == [mock_reply]
    end
  end

  describe "GET show" do
    it "assigns the requested reply as @reply" do
      Reply.stub!(:find).with("37").and_return(mock_reply)
      get :show, :id => "37"
      assigns[:reply].should equal(mock_reply)
    end
  end

  describe "GET new" do
    it "assigns a new reply as @reply" do
      Reply.stub!(:new).and_return(mock_reply)
      get :new
      assigns[:reply].should equal(mock_reply)
    end
  end

  describe "GET edit" do
    it "assigns the requested reply as @reply" do
      Reply.stub!(:find).with("37").and_return(mock_reply)
      get :edit, :id => "37"
      assigns[:reply].should equal(mock_reply)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created reply as @reply" do
        Reply.stub!(:new).with({'these' => 'params'}).and_return(mock_reply(:save => true))
        post :create, :reply => {:these => 'params'}
        assigns[:reply].should equal(mock_reply)
      end

      it "redirects to the created reply" do
        Reply.stub!(:new).and_return(mock_reply(:save => true))
        post :create, :reply => {}
        response.should redirect_to(reply_url(mock_reply))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved reply as @reply" do
        Reply.stub!(:new).with({'these' => 'params'}).and_return(mock_reply(:save => false))
        post :create, :reply => {:these => 'params'}
        assigns[:reply].should equal(mock_reply)
      end

      it "re-renders the 'new' template" do
        Reply.stub!(:new).and_return(mock_reply(:save => false))
        post :create, :reply => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested reply" do
        Reply.should_receive(:find).with("37").and_return(mock_reply)
        mock_reply.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :reply => {:these => 'params'}
      end

      it "assigns the requested reply as @reply" do
        Reply.stub!(:find).and_return(mock_reply(:update_attributes => true))
        put :update, :id => "1"
        assigns[:reply].should equal(mock_reply)
      end

      it "redirects to the reply" do
        Reply.stub!(:find).and_return(mock_reply(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(reply_url(mock_reply))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested reply" do
        Reply.should_receive(:find).with("37").and_return(mock_reply)
        mock_reply.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :reply => {:these => 'params'}
      end

      it "assigns the reply as @reply" do
        Reply.stub!(:find).and_return(mock_reply(:update_attributes => false))
        put :update, :id => "1"
        assigns[:reply].should equal(mock_reply)
      end

      it "re-renders the 'edit' template" do
        Reply.stub!(:find).and_return(mock_reply(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested reply" do
      Reply.should_receive(:find).with("37").and_return(mock_reply)
      mock_reply.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the replies list" do
      Reply.stub!(:find).and_return(mock_reply(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(replies_url)
    end
  end

end

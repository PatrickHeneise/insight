require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EnrollmentsController do

  def mock_enrollments(stubs={})
    @mock_enrollments ||= mock_model(Enrollments, stubs)
  end

  describe "GET index" do
    it "assigns all enrollments as @enrollments" do
      Enrollments.stub!(:find).with(:all).and_return([mock_enrollments])
      get :index
      assigns[:enrollments].should == [mock_enrollments]
    end
  end

  describe "GET show" do
    it "assigns the requested enrollments as @enrollments" do
      Enrollments.stub!(:find).with("37").and_return(mock_enrollments)
      get :show, :id => "37"
      assigns[:enrollments].should equal(mock_enrollments)
    end
  end

  describe "GET new" do
    it "assigns a new enrollments as @enrollments" do
      Enrollments.stub!(:new).and_return(mock_enrollments)
      get :new
      assigns[:enrollments].should equal(mock_enrollments)
    end
  end

  describe "GET edit" do
    it "assigns the requested enrollments as @enrollments" do
      Enrollments.stub!(:find).with("37").and_return(mock_enrollments)
      get :edit, :id => "37"
      assigns[:enrollments].should equal(mock_enrollments)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created enrollments as @enrollments" do
        Enrollments.stub!(:new).with({'these' => 'params'}).and_return(mock_enrollments(:save => true))
        post :create, :enrollments => {:these => 'params'}
        assigns[:enrollments].should equal(mock_enrollments)
      end

      it "redirects to the created enrollments" do
        Enrollments.stub!(:new).and_return(mock_enrollments(:save => true))
        post :create, :enrollments => {}
        response.should redirect_to(enrollment_url(mock_enrollments))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved enrollments as @enrollments" do
        Enrollments.stub!(:new).with({'these' => 'params'}).and_return(mock_enrollments(:save => false))
        post :create, :enrollments => {:these => 'params'}
        assigns[:enrollments].should equal(mock_enrollments)
      end

      it "re-renders the 'new' template" do
        Enrollments.stub!(:new).and_return(mock_enrollments(:save => false))
        post :create, :enrollments => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested enrollments" do
        Enrollments.should_receive(:find).with("37").and_return(mock_enrollments)
        mock_enrollments.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :enrollments => {:these => 'params'}
      end

      it "assigns the requested enrollments as @enrollments" do
        Enrollments.stub!(:find).and_return(mock_enrollments(:update_attributes => true))
        put :update, :id => "1"
        assigns[:enrollments].should equal(mock_enrollments)
      end

      it "redirects to the enrollments" do
        Enrollments.stub!(:find).and_return(mock_enrollments(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(enrollment_url(mock_enrollments))
      end
    end

    describe "with invalid params" do
      it "updates the requested enrollments" do
        Enrollments.should_receive(:find).with("37").and_return(mock_enrollments)
        mock_enrollments.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :enrollments => {:these => 'params'}
      end

      it "assigns the enrollments as @enrollments" do
        Enrollments.stub!(:find).and_return(mock_enrollments(:update_attributes => false))
        put :update, :id => "1"
        assigns[:enrollments].should equal(mock_enrollments)
      end

      it "re-renders the 'edit' template" do
        Enrollments.stub!(:find).and_return(mock_enrollments(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested enrollments" do
      Enrollments.should_receive(:find).with("37").and_return(mock_enrollments)
      mock_enrollments.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the enrollments list" do
      Enrollments.stub!(:find).and_return(mock_enrollments(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(enrollments_url)
    end
  end

end

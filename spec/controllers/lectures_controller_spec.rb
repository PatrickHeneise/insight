require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LecturesController do

  def mock_lecture(stubs={})
    @mock_lecture ||= mock_model(Lecture, stubs)
  end
  
  describe "GET index" do
    it "assigns all lectures as @lectures" do
      Lecture.stub!(:find).with(:all).and_return([mock_lecture])
      get :index
      assigns[:lectures].should == [mock_lecture]
    end
  end

  describe "GET show" do
    it "assigns the requested lecture as @lecture" do
      Lecture.stub!(:find).with("37").and_return(mock_lecture)
      get :show, :id => "37"
      assigns[:lecture].should equal(mock_lecture)
    end
  end

  describe "GET new" do
    it "assigns a new lecture as @lecture" do
      Lecture.stub!(:new).and_return(mock_lecture)
      get :new
      assigns[:lecture].should equal(mock_lecture)
    end
  end

  describe "GET edit" do
    it "assigns the requested lecture as @lecture" do
      Lecture.stub!(:find).with("37").and_return(mock_lecture)
      get :edit, :id => "37"
      assigns[:lecture].should equal(mock_lecture)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created lecture as @lecture" do
        Lecture.stub!(:new).with({'these' => 'params'}).and_return(mock_lecture(:save => true))
        post :create, :lecture => {:these => 'params'}
        assigns[:lecture].should equal(mock_lecture)
      end

      it "redirects to the created lecture" do
        Lecture.stub!(:new).and_return(mock_lecture(:save => true))
        post :create, :lecture => {}
        response.should redirect_to(lecture_url(mock_lecture))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved lecture as @lecture" do
        Lecture.stub!(:new).with({'these' => 'params'}).and_return(mock_lecture(:save => false))
        post :create, :lecture => {:these => 'params'}
        assigns[:lecture].should equal(mock_lecture)
      end

      it "re-renders the 'new' template" do
        Lecture.stub!(:new).and_return(mock_lecture(:save => false))
        post :create, :lecture => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested lecture" do
        Lecture.should_receive(:find).with("37").and_return(mock_lecture)
        mock_lecture.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :lecture => {:these => 'params'}
      end

      it "assigns the requested lecture as @lecture" do
        Lecture.stub!(:find).and_return(mock_lecture(:update_attributes => true))
        put :update, :id => "1"
        assigns[:lecture].should equal(mock_lecture)
      end

      it "redirects to the lecture" do
        Lecture.stub!(:find).and_return(mock_lecture(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(lecture_url(mock_lecture))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested lecture" do
        Lecture.should_receive(:find).with("37").and_return(mock_lecture)
        mock_lecture.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :lecture => {:these => 'params'}
      end

      it "assigns the lecture as @lecture" do
        Lecture.stub!(:find).and_return(mock_lecture(:update_attributes => false))
        put :update, :id => "1"
        assigns[:lecture].should equal(mock_lecture)
      end

      it "re-renders the 'edit' template" do
        Lecture.stub!(:find).and_return(mock_lecture(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested lecture" do
      Lecture.should_receive(:find).with("37").and_return(mock_lecture)
      mock_lecture.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the lectures list" do
      Lecture.stub!(:find).and_return(mock_lecture(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(lectures_url)
    end
  end

end

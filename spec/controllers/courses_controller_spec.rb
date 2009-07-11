require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CoursesController do

  def mock_course(stubs={})
    @mock_course ||= mock_model(Course, stubs)
  end
  
  describe "GET index" do
    it "assigns all courses as @courses" do
      Course.stub!(:find).with(:all).and_return([mock_course])
      get :index
      assigns[:courses].should == [mock_course]
    end
  end

  describe "GET show" do
    it "assigns the requested course as @course" do
      Course.stub!(:find).with("37").and_return(mock_course)
      get :show, :id => "37"
      assigns[:course].should equal(mock_course)
    end
  end

  describe "GET new" do
    it "assigns a new course as @course" do
      Course.stub!(:new).and_return(mock_course)
      get :new
      assigns[:course].should equal(mock_course)
    end
  end

  describe "GET edit" do
    it "assigns the requested course as @course" do
      Course.stub!(:find).with("37").and_return(mock_course)
      get :edit, :id => "37"
      assigns[:course].should equal(mock_course)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created course as @course" do
        Course.stub!(:new).with({'these' => 'params'}).and_return(mock_course(:save => true))
        post :create, :course => {:these => 'params'}
        assigns[:course].should equal(mock_course)
      end

      it "redirects to the created course" do
        Course.stub!(:new).and_return(mock_course(:save => true))
        post :create, :course => {}
        response.should redirect_to(course_url(mock_course))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved course as @course" do
        Course.stub!(:new).with({'these' => 'params'}).and_return(mock_course(:save => false))
        post :create, :course => {:these => 'params'}
        assigns[:course].should equal(mock_course)
      end

      it "re-renders the 'new' template" do
        Course.stub!(:new).and_return(mock_course(:save => false))
        post :create, :course => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested course" do
        Course.should_receive(:find).with("37").and_return(mock_course)
        mock_course.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :course => {:these => 'params'}
      end

      it "assigns the requested course as @course" do
        Course.stub!(:find).and_return(mock_course(:update_attributes => true))
        put :update, :id => "1"
        assigns[:course].should equal(mock_course)
      end

      it "redirects to the course" do
        Course.stub!(:find).and_return(mock_course(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(course_url(mock_course))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested course" do
        Course.should_receive(:find).with("37").and_return(mock_course)
        mock_course.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :course => {:these => 'params'}
      end

      it "assigns the course as @course" do
        Course.stub!(:find).and_return(mock_course(:update_attributes => false))
        put :update, :id => "1"
        assigns[:course].should equal(mock_course)
      end

      it "re-renders the 'edit' template" do
        Course.stub!(:find).and_return(mock_course(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested course" do
      Course.should_receive(:find).with("37").and_return(mock_course)
      mock_course.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the courses list" do
      Course.stub!(:find).and_return(mock_course(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(courses_url)
    end
  end

end

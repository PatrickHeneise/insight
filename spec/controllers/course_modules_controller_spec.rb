require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CourseModulesController do

  def mock_course_module(stubs={})
    @mock_course_module ||= mock_model(CourseModule, stubs)
  end
  
  describe "GET index" do
    it "assigns all course_modules as @course_modules" do
      CourseModule.stub!(:find).with(:all).and_return([mock_course_module])
      get :index
      assigns[:course_modules].should == [mock_course_module]
    end
  end

  describe "GET show" do
    it "assigns the requested course_module as @course_module" do
      CourseModule.stub!(:find).with("37").and_return(mock_course_module)
      get :show, :id => "37"
      assigns[:course_module].should equal(mock_course_module)
    end
  end

  describe "GET new" do
    it "assigns a new course_module as @course_module" do
      CourseModule.stub!(:new).and_return(mock_course_module)
      get :new
      assigns[:course_module].should equal(mock_course_module)
    end
  end

  describe "GET edit" do
    it "assigns the requested course_module as @course_module" do
      CourseModule.stub!(:find).with("37").and_return(mock_course_module)
      get :edit, :id => "37"
      assigns[:course_module].should equal(mock_course_module)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created course_module as @course_module" do
        CourseModule.stub!(:new).with({'these' => 'params'}).and_return(mock_course_module(:save => true))
        post :create, :course_module => {:these => 'params'}
        assigns[:course_module].should equal(mock_course_module)
      end

      it "redirects to the created course_module" do
        CourseModule.stub!(:new).and_return(mock_course_module(:save => true))
        post :create, :course_module => {}
        response.should redirect_to(course_module_url(mock_course_module))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved course_module as @course_module" do
        CourseModule.stub!(:new).with({'these' => 'params'}).and_return(mock_course_module(:save => false))
        post :create, :course_module => {:these => 'params'}
        assigns[:course_module].should equal(mock_course_module)
      end

      it "re-renders the 'new' template" do
        CourseModule.stub!(:new).and_return(mock_course_module(:save => false))
        post :create, :course_module => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested course_module" do
        CourseModule.should_receive(:find).with("37").and_return(mock_course_module)
        mock_course_module.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :course_module => {:these => 'params'}
      end

      it "assigns the requested course_module as @course_module" do
        CourseModule.stub!(:find).and_return(mock_course_module(:update_attributes => true))
        put :update, :id => "1"
        assigns[:course_module].should equal(mock_course_module)
      end

      it "redirects to the course_module" do
        CourseModule.stub!(:find).and_return(mock_course_module(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(course_module_url(mock_course_module))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested course_module" do
        CourseModule.should_receive(:find).with("37").and_return(mock_course_module)
        mock_course_module.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :course_module => {:these => 'params'}
      end

      it "assigns the course_module as @course_module" do
        CourseModule.stub!(:find).and_return(mock_course_module(:update_attributes => false))
        put :update, :id => "1"
        assigns[:course_module].should equal(mock_course_module)
      end

      it "re-renders the 'edit' template" do
        CourseModule.stub!(:find).and_return(mock_course_module(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested course_module" do
      CourseModule.should_receive(:find).with("37").and_return(mock_course_module)
      mock_course_module.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the course_modules list" do
      CourseModule.stub!(:find).and_return(mock_course_module(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(course_modules_url)
    end
  end

end

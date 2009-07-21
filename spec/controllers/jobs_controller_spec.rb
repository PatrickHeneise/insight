require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe JobsController do

  def mock_jobs(stubs={})
    @mock_jobs ||= mock_model(Jobs, stubs)
  end

  describe "GET index" do
    it "assigns all jobs as @jobs" do
      Jobs.stub!(:find).with(:all).and_return([mock_jobs])
      get :index
      assigns[:jobs].should == [mock_jobs]
    end
  end

  describe "GET show" do
    it "assigns the requested jobs as @jobs" do
      Jobs.stub!(:find).with("37").and_return(mock_jobs)
      get :show, :id => "37"
      assigns[:jobs].should equal(mock_jobs)
    end
  end

  describe "GET new" do
    it "assigns a new jobs as @jobs" do
      Jobs.stub!(:new).and_return(mock_jobs)
      get :new
      assigns[:jobs].should equal(mock_jobs)
    end
  end

  describe "GET edit" do
    it "assigns the requested jobs as @jobs" do
      Jobs.stub!(:find).with("37").and_return(mock_jobs)
      get :edit, :id => "37"
      assigns[:jobs].should equal(mock_jobs)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created jobs as @jobs" do
        Jobs.stub!(:new).with({'these' => 'params'}).and_return(mock_jobs(:save => true))
        post :create, :jobs => {:these => 'params'}
        assigns[:jobs].should equal(mock_jobs)
      end

      it "redirects to the created jobs" do
        Jobs.stub!(:new).and_return(mock_jobs(:save => true))
        post :create, :jobs => {}
        response.should redirect_to(job_url(mock_jobs))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved jobs as @jobs" do
        Jobs.stub!(:new).with({'these' => 'params'}).and_return(mock_jobs(:save => false))
        post :create, :jobs => {:these => 'params'}
        assigns[:jobs].should equal(mock_jobs)
      end

      it "re-renders the 'new' template" do
        Jobs.stub!(:new).and_return(mock_jobs(:save => false))
        post :create, :jobs => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested jobs" do
        Jobs.should_receive(:find).with("37").and_return(mock_jobs)
        mock_jobs.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :jobs => {:these => 'params'}
      end

      it "assigns the requested jobs as @jobs" do
        Jobs.stub!(:find).and_return(mock_jobs(:update_attributes => true))
        put :update, :id => "1"
        assigns[:jobs].should equal(mock_jobs)
      end

      it "redirects to the jobs" do
        Jobs.stub!(:find).and_return(mock_jobs(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(job_url(mock_jobs))
      end
    end

    describe "with invalid params" do
      it "updates the requested jobs" do
        Jobs.should_receive(:find).with("37").and_return(mock_jobs)
        mock_jobs.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :jobs => {:these => 'params'}
      end

      it "assigns the jobs as @jobs" do
        Jobs.stub!(:find).and_return(mock_jobs(:update_attributes => false))
        put :update, :id => "1"
        assigns[:jobs].should equal(mock_jobs)
      end

      it "re-renders the 'edit' template" do
        Jobs.stub!(:find).and_return(mock_jobs(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested jobs" do
      Jobs.should_receive(:find).with("37").and_return(mock_jobs)
      mock_jobs.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the jobs list" do
      Jobs.stub!(:find).and_return(mock_jobs(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(jobs_url)
    end
  end

end

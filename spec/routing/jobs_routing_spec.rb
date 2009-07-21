require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe JobsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "jobs", :action => "index").should == "/jobs"
    end

    it "maps #new" do
      route_for(:controller => "jobs", :action => "new").should == "/jobs/new"
    end

    it "maps #show" do
      route_for(:controller => "jobs", :action => "show", :id => "1").should == "/jobs/1"
    end

    it "maps #edit" do
      route_for(:controller => "jobs", :action => "edit", :id => "1").should == "/jobs/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "jobs", :action => "create").should == {:path => "/jobs", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "jobs", :action => "update", :id => "1").should == {:path =>"/jobs/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "jobs", :action => "destroy", :id => "1").should == {:path =>"/jobs/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/jobs").should == {:controller => "jobs", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/jobs/new").should == {:controller => "jobs", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/jobs").should == {:controller => "jobs", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/jobs/1").should == {:controller => "jobs", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/jobs/1/edit").should == {:controller => "jobs", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/jobs/1").should == {:controller => "jobs", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/jobs/1").should == {:controller => "jobs", :action => "destroy", :id => "1"}
    end
  end
end

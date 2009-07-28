require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EnrollmentsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "enrollments", :action => "index").should == "/enrollments"
    end

    it "maps #new" do
      route_for(:controller => "enrollments", :action => "new").should == "/enrollments/new"
    end

    it "maps #show" do
      route_for(:controller => "enrollments", :action => "show", :id => "1").should == "/enrollments/1"
    end

    it "maps #edit" do
      route_for(:controller => "enrollments", :action => "edit", :id => "1").should == "/enrollments/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "enrollments", :action => "create").should == {:path => "/enrollments", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "enrollments", :action => "update", :id => "1").should == {:path =>"/enrollments/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "enrollments", :action => "destroy", :id => "1").should == {:path =>"/enrollments/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/enrollments").should == {:controller => "enrollments", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/enrollments/new").should == {:controller => "enrollments", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/enrollments").should == {:controller => "enrollments", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/enrollments/1").should == {:controller => "enrollments", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/enrollments/1/edit").should == {:controller => "enrollments", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/enrollments/1").should == {:controller => "enrollments", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/enrollments/1").should == {:controller => "enrollments", :action => "destroy", :id => "1"}
    end
  end
end

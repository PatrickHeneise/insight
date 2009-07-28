require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Admin::EnrollmentsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "admin_enrollments", :action => "index").should == "/admin_enrollments"
    end

    it "maps #new" do
      route_for(:controller => "admin_enrollments", :action => "new").should == "/admin_enrollments/new"
    end

    it "maps #show" do
      route_for(:controller => "admin_enrollments", :action => "show", :id => "1").should == "/admin_enrollments/1"
    end

    it "maps #edit" do
      route_for(:controller => "admin_enrollments", :action => "edit", :id => "1").should == "/admin_enrollments/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "admin_enrollments", :action => "create").should == {:path => "/admin_enrollments", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "admin_enrollments", :action => "update", :id => "1").should == {:path =>"/admin_enrollments/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "admin_enrollments", :action => "destroy", :id => "1").should == {:path =>"/admin_enrollments/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/admin_enrollments").should == {:controller => "admin_enrollments", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/admin_enrollments/new").should == {:controller => "admin_enrollments", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/admin_enrollments").should == {:controller => "admin_enrollments", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/admin_enrollments/1").should == {:controller => "admin_enrollments", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/admin_enrollments/1/edit").should == {:controller => "admin_enrollments", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/admin_enrollments/1").should == {:controller => "admin_enrollments", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/admin_enrollments/1").should == {:controller => "admin_enrollments", :action => "destroy", :id => "1"}
    end
  end
end

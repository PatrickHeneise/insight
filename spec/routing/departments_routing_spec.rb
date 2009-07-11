require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DepartmentsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "departments", :action => "index").should == "/departments"
    end
  
    it "maps #new" do
      route_for(:controller => "departments", :action => "new").should == "/departments/new"
    end
  
    it "maps #show" do
      route_for(:controller => "departments", :action => "show", :id => "1").should == "/departments/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "departments", :action => "edit", :id => "1").should == "/departments/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "departments", :action => "create").should == {:path => "/departments", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "departments", :action => "update", :id => "1").should == {:path =>"/departments/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "departments", :action => "destroy", :id => "1").should == {:path =>"/departments/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/departments").should == {:controller => "departments", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/departments/new").should == {:controller => "departments", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/departments").should == {:controller => "departments", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/departments/1").should == {:controller => "departments", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/departments/1/edit").should == {:controller => "departments", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/departments/1").should == {:controller => "departments", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/departments/1").should == {:controller => "departments", :action => "destroy", :id => "1"}
    end
  end
end

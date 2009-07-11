require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OrganizationsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "organizations", :action => "index").should == "/organizations"
    end
  
    it "maps #new" do
      route_for(:controller => "organizations", :action => "new").should == "/organizations/new"
    end
  
    it "maps #show" do
      route_for(:controller => "organizations", :action => "show", :id => "1").should == "/organizations/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "organizations", :action => "edit", :id => "1").should == "/organizations/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "organizations", :action => "create").should == {:path => "/organizations", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "organizations", :action => "update", :id => "1").should == {:path =>"/organizations/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "organizations", :action => "destroy", :id => "1").should == {:path =>"/organizations/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/organizations").should == {:controller => "organizations", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/organizations/new").should == {:controller => "organizations", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/organizations").should == {:controller => "organizations", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/organizations/1").should == {:controller => "organizations", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/organizations/1/edit").should == {:controller => "organizations", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/organizations/1").should == {:controller => "organizations", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/organizations/1").should == {:controller => "organizations", :action => "destroy", :id => "1"}
    end
  end
end

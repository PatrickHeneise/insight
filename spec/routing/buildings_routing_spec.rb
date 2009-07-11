require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BuildingsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "buildings", :action => "index").should == "/buildings"
    end
  
    it "maps #new" do
      route_for(:controller => "buildings", :action => "new").should == "/buildings/new"
    end
  
    it "maps #show" do
      route_for(:controller => "buildings", :action => "show", :id => "1").should == "/buildings/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "buildings", :action => "edit", :id => "1").should == "/buildings/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "buildings", :action => "create").should == {:path => "/buildings", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "buildings", :action => "update", :id => "1").should == {:path =>"/buildings/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "buildings", :action => "destroy", :id => "1").should == {:path =>"/buildings/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/buildings").should == {:controller => "buildings", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/buildings/new").should == {:controller => "buildings", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/buildings").should == {:controller => "buildings", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/buildings/1").should == {:controller => "buildings", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/buildings/1/edit").should == {:controller => "buildings", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/buildings/1").should == {:controller => "buildings", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/buildings/1").should == {:controller => "buildings", :action => "destroy", :id => "1"}
    end
  end
end

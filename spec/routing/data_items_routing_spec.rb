require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DataItemsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "data_items", :action => "index").should == "/data_items"
    end
  
    it "maps #new" do
      route_for(:controller => "data_items", :action => "new").should == "/data_items/new"
    end
  
    it "maps #show" do
      route_for(:controller => "data_items", :action => "show", :id => "1").should == "/data_items/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "data_items", :action => "edit", :id => "1").should == "/data_items/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "data_items", :action => "create").should == {:path => "/data_items", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "data_items", :action => "update", :id => "1").should == {:path =>"/data_items/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "data_items", :action => "destroy", :id => "1").should == {:path =>"/data_items/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/data_items").should == {:controller => "data_items", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/data_items/new").should == {:controller => "data_items", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/data_items").should == {:controller => "data_items", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/data_items/1").should == {:controller => "data_items", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/data_items/1/edit").should == {:controller => "data_items", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/data_items/1").should == {:controller => "data_items", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/data_items/1").should == {:controller => "data_items", :action => "destroy", :id => "1"}
    end
  end
end

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FoldersController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "folders", :action => "index").should == "/folders"
    end
  
    it "maps #new" do
      route_for(:controller => "folders", :action => "new").should == "/folders/new"
    end
  
    it "maps #show" do
      route_for(:controller => "folders", :action => "show", :id => "1").should == "/folders/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "folders", :action => "edit", :id => "1").should == "/folders/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "folders", :action => "create").should == {:path => "/folders", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "folders", :action => "update", :id => "1").should == {:path =>"/folders/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "folders", :action => "destroy", :id => "1").should == {:path =>"/folders/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/folders").should == {:controller => "folders", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/folders/new").should == {:controller => "folders", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/folders").should == {:controller => "folders", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/folders/1").should == {:controller => "folders", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/folders/1/edit").should == {:controller => "folders", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/folders/1").should == {:controller => "folders", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/folders/1").should == {:controller => "folders", :action => "destroy", :id => "1"}
    end
  end
end

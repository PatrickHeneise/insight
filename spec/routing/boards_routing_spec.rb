require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BoardsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "boards", :action => "index").should == "/boards"
    end
  
    it "maps #new" do
      route_for(:controller => "boards", :action => "new").should == "/boards/new"
    end
  
    it "maps #show" do
      route_for(:controller => "boards", :action => "show", :id => "1").should == "/boards/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "boards", :action => "edit", :id => "1").should == "/boards/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "boards", :action => "create").should == {:path => "/boards", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "boards", :action => "update", :id => "1").should == {:path =>"/boards/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "boards", :action => "destroy", :id => "1").should == {:path =>"/boards/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/boards").should == {:controller => "boards", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/boards/new").should == {:controller => "boards", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/boards").should == {:controller => "boards", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/boards/1").should == {:controller => "boards", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/boards/1/edit").should == {:controller => "boards", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/boards/1").should == {:controller => "boards", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/boards/1").should == {:controller => "boards", :action => "destroy", :id => "1"}
    end
  end
end

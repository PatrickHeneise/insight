require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LecturesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "lectures", :action => "index").should == "/lectures"
    end
  
    it "maps #new" do
      route_for(:controller => "lectures", :action => "new").should == "/lectures/new"
    end
  
    it "maps #show" do
      route_for(:controller => "lectures", :action => "show", :id => "1").should == "/lectures/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "lectures", :action => "edit", :id => "1").should == "/lectures/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "lectures", :action => "create").should == {:path => "/lectures", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "lectures", :action => "update", :id => "1").should == {:path =>"/lectures/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "lectures", :action => "destroy", :id => "1").should == {:path =>"/lectures/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/lectures").should == {:controller => "lectures", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/lectures/new").should == {:controller => "lectures", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/lectures").should == {:controller => "lectures", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/lectures/1").should == {:controller => "lectures", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/lectures/1/edit").should == {:controller => "lectures", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/lectures/1").should == {:controller => "lectures", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/lectures/1").should == {:controller => "lectures", :action => "destroy", :id => "1"}
    end
  end
end

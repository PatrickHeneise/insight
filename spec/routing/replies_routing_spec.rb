require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RepliesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "replies", :action => "index").should == "/replies"
    end
  
    it "maps #new" do
      route_for(:controller => "replies", :action => "new").should == "/replies/new"
    end
  
    it "maps #show" do
      route_for(:controller => "replies", :action => "show", :id => "1").should == "/replies/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "replies", :action => "edit", :id => "1").should == "/replies/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "replies", :action => "create").should == {:path => "/replies", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "replies", :action => "update", :id => "1").should == {:path =>"/replies/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "replies", :action => "destroy", :id => "1").should == {:path =>"/replies/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/replies").should == {:controller => "replies", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/replies/new").should == {:controller => "replies", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/replies").should == {:controller => "replies", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/replies/1").should == {:controller => "replies", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/replies/1/edit").should == {:controller => "replies", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/replies/1").should == {:controller => "replies", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/replies/1").should == {:controller => "replies", :action => "destroy", :id => "1"}
    end
  end
end

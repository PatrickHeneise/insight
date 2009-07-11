require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TopicsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "topics", :action => "index").should == "/topics"
    end
  
    it "maps #new" do
      route_for(:controller => "topics", :action => "new").should == "/topics/new"
    end
  
    it "maps #show" do
      route_for(:controller => "topics", :action => "show", :id => "1").should == "/topics/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "topics", :action => "edit", :id => "1").should == "/topics/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "topics", :action => "create").should == {:path => "/topics", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "topics", :action => "update", :id => "1").should == {:path =>"/topics/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "topics", :action => "destroy", :id => "1").should == {:path =>"/topics/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/topics").should == {:controller => "topics", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/topics/new").should == {:controller => "topics", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/topics").should == {:controller => "topics", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/topics/1").should == {:controller => "topics", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/topics/1/edit").should == {:controller => "topics", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/topics/1").should == {:controller => "topics", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/topics/1").should == {:controller => "topics", :action => "destroy", :id => "1"}
    end
  end
end

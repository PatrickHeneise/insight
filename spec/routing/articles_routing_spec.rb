require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ArticlesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "articles", :action => "index").should == "/articles"
    end
  
    it "maps #new" do
      route_for(:controller => "articles", :action => "new").should == "/articles/new"
    end
  
    it "maps #show" do
      route_for(:controller => "articles", :action => "show", :id => "1").should == "/articles/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "articles", :action => "edit", :id => "1").should == "/articles/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "articles", :action => "create").should == {:path => "/articles", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "articles", :action => "update", :id => "1").should == {:path =>"/articles/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "articles", :action => "destroy", :id => "1").should == {:path =>"/articles/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/articles").should == {:controller => "articles", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/articles/new").should == {:controller => "articles", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/articles").should == {:controller => "articles", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/articles/1").should == {:controller => "articles", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/articles/1/edit").should == {:controller => "articles", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/articles/1").should == {:controller => "articles", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/articles/1").should == {:controller => "articles", :action => "destroy", :id => "1"}
    end
  end
end

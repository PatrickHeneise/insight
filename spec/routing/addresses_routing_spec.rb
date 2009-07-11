require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AddressesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "addresses", :action => "index").should == "/addresses"
    end
  
    it "maps #new" do
      route_for(:controller => "addresses", :action => "new").should == "/addresses/new"
    end
  
    it "maps #show" do
      route_for(:controller => "addresses", :action => "show", :id => "1").should == "/addresses/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "addresses", :action => "edit", :id => "1").should == "/addresses/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "addresses", :action => "create").should == {:path => "/addresses", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "addresses", :action => "update", :id => "1").should == {:path =>"/addresses/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "addresses", :action => "destroy", :id => "1").should == {:path =>"/addresses/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/addresses").should == {:controller => "addresses", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/addresses/new").should == {:controller => "addresses", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/addresses").should == {:controller => "addresses", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/addresses/1").should == {:controller => "addresses", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/addresses/1/edit").should == {:controller => "addresses", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/addresses/1").should == {:controller => "addresses", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/addresses/1").should == {:controller => "addresses", :action => "destroy", :id => "1"}
    end
  end
end

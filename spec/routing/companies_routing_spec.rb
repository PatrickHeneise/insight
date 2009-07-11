require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CompaniesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "companies", :action => "index").should == "/companies"
    end
  
    it "maps #new" do
      route_for(:controller => "companies", :action => "new").should == "/companies/new"
    end
  
    it "maps #show" do
      route_for(:controller => "companies", :action => "show", :id => "1").should == "/companies/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "companies", :action => "edit", :id => "1").should == "/companies/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "companies", :action => "create").should == {:path => "/companies", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "companies", :action => "update", :id => "1").should == {:path =>"/companies/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "companies", :action => "destroy", :id => "1").should == {:path =>"/companies/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/companies").should == {:controller => "companies", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/companies/new").should == {:controller => "companies", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/companies").should == {:controller => "companies", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/companies/1").should == {:controller => "companies", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/companies/1/edit").should == {:controller => "companies", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/companies/1").should == {:controller => "companies", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/companies/1").should == {:controller => "companies", :action => "destroy", :id => "1"}
    end
  end
end

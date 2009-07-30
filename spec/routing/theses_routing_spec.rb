require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ThesesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "theses", :action => "index").should == "/theses"
    end

    it "maps #new" do
      route_for(:controller => "theses", :action => "new").should == "/theses/new"
    end

    it "maps #show" do
      route_for(:controller => "theses", :action => "show", :id => "1").should == "/theses/1"
    end

    it "maps #edit" do
      route_for(:controller => "theses", :action => "edit", :id => "1").should == "/theses/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "theses", :action => "create").should == {:path => "/theses", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "theses", :action => "update", :id => "1").should == {:path =>"/theses/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "theses", :action => "destroy", :id => "1").should == {:path =>"/theses/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/theses").should == {:controller => "theses", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/theses/new").should == {:controller => "theses", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/theses").should == {:controller => "theses", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/theses/1").should == {:controller => "theses", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/theses/1/edit").should == {:controller => "theses", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/theses/1").should == {:controller => "theses", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/theses/1").should == {:controller => "theses", :action => "destroy", :id => "1"}
    end
  end
end

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RoomsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "rooms", :action => "index").should == "/rooms"
    end
  
    it "maps #new" do
      route_for(:controller => "rooms", :action => "new").should == "/rooms/new"
    end
  
    it "maps #show" do
      route_for(:controller => "rooms", :action => "show", :id => "1").should == "/rooms/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "rooms", :action => "edit", :id => "1").should == "/rooms/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "rooms", :action => "create").should == {:path => "/rooms", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "rooms", :action => "update", :id => "1").should == {:path =>"/rooms/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "rooms", :action => "destroy", :id => "1").should == {:path =>"/rooms/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/rooms").should == {:controller => "rooms", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/rooms/new").should == {:controller => "rooms", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/rooms").should == {:controller => "rooms", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/rooms/1").should == {:controller => "rooms", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/rooms/1/edit").should == {:controller => "rooms", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/rooms/1").should == {:controller => "rooms", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/rooms/1").should == {:controller => "rooms", :action => "destroy", :id => "1"}
    end
  end
end

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CoursesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "courses", :action => "index").should == "/courses"
    end
  
    it "maps #new" do
      route_for(:controller => "courses", :action => "new").should == "/courses/new"
    end
  
    it "maps #show" do
      route_for(:controller => "courses", :action => "show", :id => "1").should == "/courses/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "courses", :action => "edit", :id => "1").should == "/courses/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "courses", :action => "create").should == {:path => "/courses", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "courses", :action => "update", :id => "1").should == {:path =>"/courses/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "courses", :action => "destroy", :id => "1").should == {:path =>"/courses/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/courses").should == {:controller => "courses", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/courses/new").should == {:controller => "courses", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/courses").should == {:controller => "courses", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/courses/1").should == {:controller => "courses", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/courses/1/edit").should == {:controller => "courses", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/courses/1").should == {:controller => "courses", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/courses/1").should == {:controller => "courses", :action => "destroy", :id => "1"}
    end
  end
end

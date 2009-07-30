require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Thesis do
  before(:each) do
    @valid_attributes = {
      :editor_id => 1,
      :coeditor_id => 1,
      :course_id => 1,
      :topic => "value for topic",
      :supervisor_id => 1,
      :assistant_supervisor_id => 1,
      :delivery => Date.today,
      :state => "value for state",
      :abstract => "value for abstract",
      :url => "value for url"
    }
  end

  it "should create a new instance given valid attributes" do
    Thesis.create!(@valid_attributes)
  end
end

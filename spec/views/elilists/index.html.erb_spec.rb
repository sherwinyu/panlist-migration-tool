require 'spec_helper'

describe "elilists/index" do
  before(:all) { reset_records}

  before(:each) do
    @elilists = assign(:elilist, Elilist.all)
  end

  xit "renders a list of elilists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Subscribers".to_s, :count => 2
    assert_select "tr>td", :text => "Owners".to_s, :count => 2
    assert_select "tr>td", :text => "List Type".to_s, :count => 2
  end
end

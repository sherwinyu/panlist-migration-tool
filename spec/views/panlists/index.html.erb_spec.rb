require 'spec_helper'

describe "panlists/index" do
  before(:all) { reset_records}
  before(:each) do
    assign(:panlists, Panlist.all)
  end

  xit "renders a list of panlists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Subscribers".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end

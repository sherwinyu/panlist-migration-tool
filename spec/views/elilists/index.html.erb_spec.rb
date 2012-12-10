require 'spec_helper'

describe "elilists/index" do
  before(:each) do
    assign(:elilists, [
      stub_model(Elilist,
        :name => "Name",
        :subscribers => "Subscribers",
        :owners => "Owners",
        :list_type => "List Type"
      ),
      stub_model(Elilist,
        :name => "Name",
        :subscribers => "Subscribers",
        :owners => "Owners",
        :list_type => "List Type"
      )
    ])
  end

  it "renders a list of elilists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Subscribers".to_s, :count => 2
    assert_select "tr>td", :text => "Owners".to_s, :count => 2
    assert_select "tr>td", :text => "List Type".to_s, :count => 2
  end
end

require 'spec_helper'

describe "panlists/index" do
  before(:each) do
    assign(:panlists, [
      stub_model(Panlist,
        :name => "Name",
        :subscribers => "Subscribers",
        :public => false,
        :migrated => false
      ),
      stub_model(Panlist,
        :name => "Name",
        :subscribers => "Subscribers",
        :public => false,
        :migrated => false
      )
    ])
  end

  it "renders a list of panlists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Subscribers".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end

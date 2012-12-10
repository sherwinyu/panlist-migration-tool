require 'spec_helper'

describe "owners/index" do
  before(:each) do
    assign(:owners, [
      stub_model(Owner,
        :netid => "Netid"
      ),
      stub_model(Owner,
        :netid => "Netid"
      )
    ])
  end

  it "renders a list of owners" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Netid".to_s, :count => 2
  end
end

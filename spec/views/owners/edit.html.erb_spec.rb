require 'spec_helper'

describe "owners/edit" do
  before(:each) do
    @owner = assign(:owner, stub_model(Owner,
      :netid => "MyString"
    ))
  end

  it "renders the edit owner form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => owners_path(@owner), :method => "post" do
      assert_select "input#owner_netid", :name => "owner[netid]"
    end
  end
end

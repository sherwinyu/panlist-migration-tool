require 'spec_helper'

describe "panlists/edit" do
  before(:each) do
    @panlist = assign(:panlist, stub_model(Panlist,
      :name => "MyString",
      :subscribers => "MyString",
      :public => false,
      :migrated => false
    ))
  end

  it "renders the edit panlist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => panlists_path(@panlist), :method => "post" do
      assert_select "input#panlist_name", :name => "panlist[name]"
      assert_select "input#panlist_subscribers", :name => "panlist[subscribers]"
      assert_select "input#panlist_public", :name => "panlist[public]"
      assert_select "input#panlist_migrated", :name => "panlist[migrated]"
    end
  end
end

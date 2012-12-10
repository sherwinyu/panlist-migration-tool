require 'spec_helper'

describe "panlists/new" do
  before(:each) do
    assign(:panlist, stub_model(Panlist,
      :name => "MyString",
      :subscribers => "MyString",
      :public => false,
      :migrated => false
    ).as_new_record)
  end

  it "renders new panlist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => panlists_path, :method => "post" do
      assert_select "input#panlist_name", :name => "panlist[name]"
      assert_select "input#panlist_subscribers", :name => "panlist[subscribers]"
      assert_select "input#panlist_public", :name => "panlist[public]"
      assert_select "input#panlist_migrated", :name => "panlist[migrated]"
    end
  end
end

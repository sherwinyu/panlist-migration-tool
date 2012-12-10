require 'spec_helper'

describe "elilists/new" do
  before(:each) do
    assign(:elilist, stub_model(Elilist,
      :name => "MyString",
      :subscribers => "MyString",
      :owners => "MyString",
      :list_type => "MyString"
    ).as_new_record)
  end

  it "renders new elilist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => elilists_path, :method => "post" do
      assert_select "input#elilist_name", :name => "elilist[name]"
      assert_select "input#elilist_subscribers", :name => "elilist[subscribers]"
      assert_select "input#elilist_owners", :name => "elilist[owners]"
      assert_select "input#elilist_list_type", :name => "elilist[list_type]"
    end
  end
end

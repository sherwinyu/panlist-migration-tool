require 'spec_helper'

describe "elilists/edit" do
  before(:all) { reset_records}
  before(:each) do
    @elilist = assign(:elilist, Elilist.last)
  end

  it "renders the edit elilist form" do
    render
      assert_select "form", :action => elilists_path(@elilist), :method => "post" do
      assert_select "input", :name => "elilist[name]"
      assert_select "input", :name => "elilist[subscribers_raw]"
      assert_select "input", :name => "elilist[owners_raw]"
      assert_select "input", :name => "elilist[list_type]"
    end
  end
end

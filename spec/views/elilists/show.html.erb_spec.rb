require 'spec_helper'

describe "elilists/show" do
  before(:all) { reset_records}

  before(:each) do
    @elilist = assign(:elilist, Elilist.last)
  end
  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Subscribers/)
    rendered.should match(/Owners/)
    rendered.should match(/List type/)
  end
end

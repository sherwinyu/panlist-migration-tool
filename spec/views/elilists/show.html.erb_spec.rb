require 'spec_helper'

describe "elilists/show" do
  before(:each) do
    @elilist = assign(:elilist, stub_model(Elilist,
      :name => "Name",
      :subscribers => "Subscribers",
      :owners => "Owners",
      :list_type => "List Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Subscribers/)
    rendered.should match(/Owners/)
    rendered.should match(/List Type/)
  end
end

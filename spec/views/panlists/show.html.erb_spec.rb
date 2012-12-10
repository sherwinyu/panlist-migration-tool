require 'spec_helper'

describe "panlists/show" do
  before(:each) do
    @panlist = assign(:panlist, stub_model(Panlist,
      :name => "Name",
      :subscribers => "Subscribers",
      :public => false,
      :migrated => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Subscribers/)
    rendered.should match(/false/)
    rendered.should match(/false/)
  end
end

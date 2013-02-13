require 'spec_helper'

describe Elilist do
  before(:all) do
    reset_records
  end

  describe "should have the proper attributes" do
    it { should respond_to :name }
    it { should respond_to :list_id }
    it { should respond_to :list_type }
    it { should respond_to :owners }
    it { should respond_to :owners_arr }
  end

  describe 'google group type' do
    @e1 = Elilist.find_by_name 'directorslist'
    @e1.google_group_type.should == 'Owner'
    @e1.list_type = "Moderated"
    @e1.google_group_type.should == 'Member'
    @e1.list_type = "Discussion"
    @e1.google_group_type.should == 'Anyone'
  end

  describe "create google group" do 
    it "should make the proper call to a ProvisioningApi instance" do
      include GAppsProvisioning
      @e1 = Elilist.find_by_name 'directorslist'

      # GAppsProvisioning::ProvisioningApi.any_instance.should_receive(:retrieve_all_users).and_return true
      # GAppsProvisioning::Connection.any_instance.should_receive(:retrieve_all_users).and_return true
      GAppsProvisioning::ProvisioningApi.should_receive(:new).and_call_original
      GAppsProvisioning::ProvisioningApi.any_instance.should_receive(:create_group).with(
        'directorslist',
        ['directorslist', 'just a description', 'Owner']
      ).and_return true

      @e1.create_google_group
    end
    it "should make the appropriate calls to add subscribers" do
    end
    it "should make the appropriate calls to add members" do
    end
    it 
  end
  describe "create google group integration test" do
    it "should hit create the group + members and owners on the server and be verifiable" do

    end
  end
end

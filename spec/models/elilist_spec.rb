require 'spec_helper'

describe Elilist do
  before(:all) do
    reset_records
  end

  describe "should have the proper attributes" do
    it { should respond_to :name }
    it { should respond_to :list_id }
    it { should respond_to :list_type }
    it { should respond_to :owners_raw }
    it { should respond_to :owners }
    it { should respond_to :subscribers_raw }
    it { should respond_to :subscribers }
  end

  describe 'google group type' do
    @e1 = Elilist.find_by_name 'directorslist'
    @e1.google_group_type.should == 'Owner'
    @e1.list_type = "Moderated"
    @e1.google_group_type.should == 'Member'
    @e1.list_type = "Discussion"
    @e1.google_group_type.should == 'Anyone'
  end
  describe 'google group id' do
    it "should use the list name when list id is not present" do
      @e1 = Elilist.find_by_name 'directorslist'
      @e1.list_id.should be_nil
      @e1.google_group_id.should == 'directorslist'
    end

    it "should use convert spaces to dashes in the list_id" do
      @e1 = Elilist.find_by_name 'directorslist'
      @e1.list_id = "my list name"
      @e1.google_group_id.should == 'my-list-name'
    end

    it "should use convert spaces to dashes in the list name if list id is not present" do
      @e1 = Elilist.find_by_name 'directorslist'
      @e1.list_id.should be_nil
      @e1.name = "my list name"
      @e1.google_group_id.should == 'my-list-name'
    end

  end

  describe "create google group" do 
    include GAppsProvisioning
    it "should make the proper call to a ProvisioningApi instance" do
      @e1 = Elilist.find_by_name 'directorslist'

      GAppsProvisioning::ProvisioningApi.should_receive(:new).and_call_original
      GAppsProvisioning::ProvisioningApi.any_instance.stub(:add_member_to_group).and_return true
      GAppsProvisioning::ProvisioningApi.any_instance.stub(:add_owner_to_group).and_return true

      GAppsProvisioning::ProvisioningApi.any_instance.should_receive(:create_group).with(
        'directorslist',
        ['directorslist', 'just a description', 'Owner']
      ).and_return true

      @e1.create_google_group
    end

    it "should make the appropriate calls to add members" do
      @e1 = Elilist.find_by_name 'directorslist'

      GAppsProvisioning::ProvisioningApi.should_receive(:new).and_call_original
      GAppsProvisioning::ProvisioningApi.any_instance.stub(:create_group)
      GAppsProvisioning::ProvisioningApi.any_instance.stub(:add_owner_to_group)

      GAppsProvisioning::ProvisioningApi.any_instance.should_receive(:add_member_to_group).with(
        'a@b.c', "directorslist").and_return true
      GAppsProvisioning::ProvisioningApi.any_instance.should_receive(:add_member_to_group).with(
        'd@e.f', "directorslist").and_return true
      GAppsProvisioning::ProvisioningApi.any_instance.should_receive(:add_member_to_group).with(
        'g@r.f', "directorslist").and_return true

      @e1.create_google_group
    end

    it "should make the appropriate calls to add owners" do
    end

    it 
  end
  describe "create google group integration test" do
    it "should hit create the group + members and owners on the server and be verifiable" do

    end
  end
end

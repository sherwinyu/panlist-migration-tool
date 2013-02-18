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

  describe "google api wrappers" do
    include GAppsProvisioning
    describe "google_api" do
    end

    describe "google_group_create" do
      it "should make the underlying api call" do
        @e1 = Elilist.find_by_name 'directorslist'

        google = double("GAppsProvisioning::ProvisioningApi")
        Elilist.should_receive(:google_api).and_return google

        google.should_receive(:create_group).with(
          'directorslist', ['directorslist', 'just a description', 'Owner']
        ).and_return true

        @e1.google_group_create
      end
    end

    describe "google_group_add_member" do
      it "should make the underlying api call" do
        @e1 = Elilist.find_by_name 'directorslist'

        google = double("GAppsProvisioning::ProvisioningApi")
        Elilist.should_receive(:google_api).and_return google

        google.should_receive(:add_member_to_group).with(
          'valid_email@yale.edu', @e1.google_group_id
        ).and_return true

        @e1.google_group_add_member "valid_email@yale.edu"
      end
    end

  end

  describe "create google group" do 
    include GAppsProvisioning
    it "it should use the wrapper methods" do
      @e1 = Elilist.find_by_name 'directorslist'
      @e1.should_receive(:google_group_create).and_return true
      @e1.should_receive(:google_group_add_member).with("a@b.c").and_return true
      @e1.should_receive(:google_group_add_member).with("d@e.f").and_return true
      @e1.should_receive(:google_group_add_member).with("g@r.f").and_return true

      @e1.create_google_group
    end
  end

  describe "create google group integration test" do
    include GAppsProvisioning

    it "should hit create the group + members and owners on the server and be verifiable" do
      @e1 = Elilist.find_by_name 'directorslist'
      @e1.list_id = 'newlist'
      @e1.subscribers_raw = "adam.bray@yale.edu\nsherwin.yu@yale.edu\nsherwinxyu@gmail.com"
      @e1.create_google_group
      groups = Elilist.google_api.retrieve_all_groups()
      groups.map(&:group_id).map { |s| s[/[^@]+/]}. should include @e1.google_group_id
      members = Elilist.google_api.retrieve_all_members @e1.google_group_id
      members.map(&:member_id).should include *@e1.subscribers

    end
    after { @e1.delete_google_group; binding.pry }
  end
end

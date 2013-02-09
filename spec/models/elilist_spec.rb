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
  
  end
  describe "create google group" do 
    it "should make the proper call to a ProvisioningApi instance" do
      include GAppsProvisioning
      @e1 = Elilist.find_by_name 'directorslist'
      # GAppsProvisioning::ProvisioningApi.should_receive(:new).and_call_original
      GAppsProvisioning::Connection.any_instance.should_receive(:create_group).with(
        'directorslist',
        ['directorslist', 'just a description', 'Owner']
      ).and_return true

      @e1.create_google_group
    end


    
      

  end
end

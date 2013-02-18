require 'spec_helper'

describe Panlist do
  before(:all) do
    reset_records
  end

  describe "should have the proper attributes" do
    it { should respond_to :name }
    it { should respond_to :list_name }
    it { should respond_to :id }
    it { should respond_to :list_id }
    it { should respond_to :active? }
    it { should respond_to :public? }
    it { should respond_to :owners }
  end

  describe "owners association" do
    it "should load existing relations" do
      p = Panlist.find_by_list_name 'directorslist'
      p.owners.should have_exactly(3).owners
      p.owners.should include(@o1, @o2, @o3)
    end

    it "should be empty when no existing relations exist" do
      p = Panlist.find_by_list_name 'emilys-freshmen'
      p.owners.should be_empty
    end

    it "should save new ownerships when itself is saved" do
      p = Panlist.find_by_list_name 'cat3rocks'

      # First, verify that p doesn't have o3 o4 o5 or o6 as an owner
      p.owners.should_not include @o3, @o4, @o5, @o6
      Ownership.where(list_id: p.id, owner: @o3.netid).should be_empty
      Ownership.where(list_id: p.id, owner: @o4.netid).should be_empty
      Ownership.where(list_id: p.id, owner: @o5.netid).should be_empty
      Ownership.where(list_id: p.id, owner: @o6.netid).should be_empty

      # then add o3 and o4
      p.owners << @o3 << @o4

      # verify that the in-memory array has been updated
      p.owners.should include @o3, @o4
      
      # verify that the ownerships haven't been created yet
      Ownership.where(list_id: p.id, owner: @o3.netid).should be_empty
      Ownership.where(list_id: p.id, owner: @o4.netid).should be_empty
      Ownership.where(list_id: p.id, owner: @o5.netid).should be_empty
      Ownership.where(list_id: p.id, owner: @o6.netid).should be_empty

      # save to database
      p.save
      p.reload
      p.owners.should include @o3, @o4

      # verify that the ownership records for o3 and o4 were written
      Ownership.where(list_id: p.id, owner: @o3.netid).should have_exactly(1).record
      Ownership.where(list_id: p.id, owner: @o4.netid).should have_exactly(1).record
      Ownership.where(list_id: p.id, owner: @o5.netid).should be_empty
      Ownership.where(list_id: p.id, owner: @o6.netid).should be_empty
    end
  end
end

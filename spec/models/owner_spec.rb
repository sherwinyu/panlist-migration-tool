require 'spec_helper'

describe Owner do
  before :all do
    reset_records
  end

  describe "should have the proper attributes" do
    it { should respond_to :netid }
    it { should respond_to :id }
    it { should respond_to :panlists }
  end

  describe "panlists association" do
    it "should load existing relations" do
      o = Owner.find_by_netid 'sy23'
      o.panlists.should have_exactly(2).panlists
      o.panlists.should include(@p1, @p2)
    end
    
    it "should be empty when no existing relations exist" do
      o = Owner.find_by_netid 'lt275'
      o.panlists.should be_empty
    end

    it "should save new ownerships when itself is saved" do
      o = Owner.find_by_netid 'sy23'
      o.panlists.should_not include(@p3)
      Ownership.where(list_id: @p3.id, owner: o.netid).should be_empty

      o.panlists << @p3
      o.panlists.should include(@p3)
      Ownership.where(list_id: @p3.id, owner: o.netid).should be_empty

      o.save
      o.reload
      o.panlists.should include(@p3)
      Ownership.where(list_id: @p3.id, owner: o.netid).should have(1).relation
    end

  end
end

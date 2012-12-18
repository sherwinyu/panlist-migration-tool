require 'spec_helper'

describe Owner do
  # TODO(syu): move into fixtures or factories
  before(:all) do
    @p1 = Panlist.create name: 'directorslist', public: false, subscribers: "a@b.c\nd@e.f\ng@r.f" 
    @p2 = Panlist.create name: 'cat3rocks', public: false, subscribers: "coolcat@one.com\ncoolcat@two.com\ncoolcat@three.com" 
    @p3 = Panlist.create name: 'emilys-freshmen', public: true, subscribers: "aaa@b.c\nd@e.f\ng@r.f"

    @o1 = Owner.find_or_create_by_netid  'sy23'
    @o2 = Owner.find_or_create_by_netid  'alb64'
    @o3 = Owner.find_or_create_by_netid  'icc7'
    @o4 = Owner.find_or_create_by_netid  'lt275'
    @o5 = Owner.find_or_create_by_netid  'rx8'
    @o6 = Owner.find_or_create_by_netid  'ft66'
    @o7 = Owner.find_or_create_by_netid  'jmq23'
    @o8 = Owner.find_or_create_by_netid  'ayl8'

    @os1 = Ownership.create panlist_id: @p1.id, owner_id: @o1.netid
    @os2 = Ownership.create panlist_id: @p1.id, owner_id: @o2.netid
    @os3 = Ownership.create panlist_id: @p1.id, owner_id: @o3.netid
     
    @os4 = Ownership.create panlist_id: @p2.id, owner_id: @o1.netid
    @os5 = Ownership.create panlist_id: @p2.id, owner_id: @o2.netid
    @os6 = Ownership.create panlist_id: @p2.id, owner_id: @o7.netid
    @os7 = Ownership.create panlist_id: @p2.id, owner_id: @o8.netid
  end

  after :all do
    Ownership.delete_all
    Panlist.delete_all
    Owner.delete_all
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

    it "should save additional records when owner is modified" do
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

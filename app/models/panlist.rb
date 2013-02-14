require 'gappsprovisioning/provisioningapi.rb'

class Panlist < ActiveRecord::Base

  # Setup connection to legacy postgres database
  # establish_connection "ahi_#{Rails.env}"
  
  establish_connection "ahi_#{Rails.env}"
  self.table_name = 'lists'
  set_primary_key :list_id
  alias_attribute :name, :list_name
  alias_attribute :id, :list_id

  attr_accessor :owners
  # attr_accessor :subscribers

  attr_accessible :migrated, :name, :public, :subscribers
  has_and_belongs_to_many :owners

  # attr_accessible :owners

  def owners
    # set @owners instance variable by
    # 1) grabbing all Ownerships containing this panlist
    # 2) converting each Ownership into an Owner
    @owners ||= Ownership.where(list_id: self.id).map do |ownership|
      Owner.find_by_netid(ownership.owner_id)
    end
  end

  before_save :write_owners

  def write_owners
    # Note: we can't use owner_id and panlist_id because aliases aren't supported in dynamic find_or_creates
    @owners.each { |o| Ownership.find_or_create_by_owner_and_list_id o.netid, self.id } if @owners
  end

  def num_members 
    self.members.size
  end

  def members
    # TODO(syu): to be overriden with whatever function pulls in the flat list of subscriber addresses
    subscribers.split
  end
end

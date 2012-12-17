class Panlist < ActiveRecord::Base

  #Setup connection to legacy postgres database
  # establish_connection "ahi_#{Rails.env}"
  
  establish_connection "ahi_development"
  self.table_name = 'lists'
  set_primary_key :list_id
  alias_attribute :name, :list_name
  alias_attribute :id, :list_id

  attr_accessor :owners

  attr_accessible :migrated, :name, :public, :subscribers
  has_and_belongs_to_many :owners

  # attr_accessible :owners

  def owners
    @owners ||= Ownership.where(list_id: self.id).map { |ownership| Owner.find_by_netid(ownership.owner_id) }
  end

  before_save :write_owners

  def write_owners
    @owners.each { |o| Ownership.find_or_create_by_owner_and_list_id o.netid, self.id }
  end

  def num_members 
    subscribers.size
  end

  def members
    subscribers.split
  end

end

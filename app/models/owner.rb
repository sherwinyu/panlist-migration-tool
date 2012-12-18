class Owner < ActiveRecord::Base
  attr_accessible :netid

  # has_and_belongs_to_many :panlists
  def self.wrap netid
    Owner.find_or_initialize_by_netid netid
  end

  attr_accessor :panlists

  def panlists
    @panlists ||= Ownership.where(owner: self.netid).map { |oship| Panlist.find_by_list_id oship.panlist_id }
  end

  before_save :write_panlists
  def write_panlists
    @panlists.each { |p| Ownership.find_or_create_by_owner_and_list_id self.netid, p.list_id } if @panlists
  end

end

class Panlist < ActiveRecord::Base

  #Setup connection to legacy postgres database
  establish_connection "ahi_fake"
  self.table_name = 'lists'
  alias_attribute :name, :list_name

  attr_accessible :migrated, :name, :public, :subscribers
  has_and_belongs_to_many :owners

  def num_members 
    subscribers.size
  end

  def members
    subscribers.split
  end

end

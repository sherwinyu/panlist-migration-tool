class Panlist < ActiveRecord::Base
  establish_connection "ahi_fake"

  attr_accessible :migrated, :name, :public, :subscribers
  has_and_belongs_to_many :owners

  def num_members 
    subscribers.size
  end

  def members
    subscribers.split
  end

end

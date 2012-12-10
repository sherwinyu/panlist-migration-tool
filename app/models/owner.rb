class Owner < ActiveRecord::Base
  attr_accessible :netid
  has_and_belongs_to_many :panlists
end

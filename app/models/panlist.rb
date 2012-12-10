class Panlist < ActiveRecord::Base
  attr_accessible :migrated, :name, :public, :subscribers
  has_and_belongs_to_many :owners
end

class Panlist < ActiveRecord::Base
  attr_accessible :migrated, :name, :public, :subscribers
end

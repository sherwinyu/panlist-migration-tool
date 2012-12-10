class Elilist < ActiveRecord::Base
  attr_accessible :list_type, :name, :owners, :subscribers
end

class Elilist < ActiveRecord::Base
  attr_accessible :list_type, :name, :owners, :subscribers
  attr_accessor :members
  attr_accessor :owners_arr
end

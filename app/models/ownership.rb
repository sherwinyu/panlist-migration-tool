class Ownership < ActiveRecord::Base
  establish_connection "ahi_development"
  self.table_name = 'owners'
  alias_attribute :owner_id, :owner
  alias_attribute :panlist_id, :list_id

  self.find_or_create_by_ownerid
end

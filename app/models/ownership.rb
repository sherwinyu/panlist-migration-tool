class Ownership < ActiveRecord::Base
  establish_connection "ahi_#{Rails.env}"
  self.table_name = 'owners'
  alias_attribute :owner_id, :owner
  alias_attribute :panlist_id, :list_id
end

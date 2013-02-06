class CreateAhiTables < ActiveRecord::Migration
  def connection
    @connection = ActiveRecord::Base.establish_connection("ahi_#{Rails.env}").connection
    binding.pry
  end

  def up
    # list_id |   list_name   | active | status | public 
  end
  def down
    drop_table :lists
  end
end

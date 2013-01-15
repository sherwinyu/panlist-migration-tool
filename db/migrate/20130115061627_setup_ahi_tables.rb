class SetupAhiTables < ActiveRecord::Migration
  def connection
    @connection = ActiveRecord::Base.establish_connection("ahi_#{Rails.env}").connection
  end

  def up
    puts 'up!'
    create_table :lists, primary_key: :list_id do |t|
      t.integer :list_id
      t.string :list_name
      t.boolean :active
      t.string :status
      t.boolean :public

      t.boolean :migrated
      t.string :subscribers

      t.timestamps
    end


    # list_id |  owner   
    create_table :owners do |t|
      t.integer :list_id
      t.string :owner
    end
    puts 'up!'

    # necessary because: http://stackoverflow.com/a/11020572/1164573
    @connection = ActiveRecord::Base.establish_connection("#{Rails.env}").connection
  end

  def down
    puts 'down!'
    drop_table :lists
    drop_table :owners
    puts 'down!'

    # necessary because: http://stackoverflow.com/a/11020572/1164573
    @connection = ActiveRecord::Base.establish_connection("#{Rails.env}").connection
  end
end

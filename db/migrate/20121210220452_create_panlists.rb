class CreatePanlists < ActiveRecord::Migration
  def change
    create_table :panlists do |t|
      t.string :name
      t.string :subscribers
      t.boolean :public
      t.boolean :migrated

      t.timestamps
    end
  end
end

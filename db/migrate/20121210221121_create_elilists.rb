class CreateElilists < ActiveRecord::Migration
  def change
    create_table :elilists do |t|
      t.string :name
      t.string :subscribers
      t.string :owners
      t.string :list_type

      t.timestamps
    end
  end
end

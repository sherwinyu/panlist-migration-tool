class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :netid

      t.timestamps
    end
  end
end

class CreateOwnerPanlistJoinTable < ActiveRecord::Migration
  def change
    create_table :owners_panlists, :id => false do |t|
      t.integer :owner_id
      t.integer :panlist_id
    end
  end
end

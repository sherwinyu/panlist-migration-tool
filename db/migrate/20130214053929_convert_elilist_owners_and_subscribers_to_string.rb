class ConvertElilistOwnersAndSubscribersToString < ActiveRecord::Migration
  def change
    add_column :elilists, :subscribers_raw, :string
    add_column :elilists, :owners_raw, :string
    remove_column :elilists, :subscribers
    remove_column :elilists, :owners
  end
end

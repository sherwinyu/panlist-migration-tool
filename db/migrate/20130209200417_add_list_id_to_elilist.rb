class AddListIdToElilist < ActiveRecord::Migration
  def change
    add_column :elilists, :list_id, :string
  end
end

class AddDescriptionToElilist < ActiveRecord::Migration
  def change
    add_column :elilists, :description, :string
  end
end

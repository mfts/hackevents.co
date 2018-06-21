class AddTeleportIdToCities < ActiveRecord::Migration[4.2]
  def change
    add_column :cities, :teleport_id, :string
  end
end

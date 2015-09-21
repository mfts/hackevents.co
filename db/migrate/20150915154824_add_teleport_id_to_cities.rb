class AddTeleportIdToCities < ActiveRecord::Migration
  def change
    add_column :cities, :teleport_id, :string
  end
end

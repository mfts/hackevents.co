class AddRadiusToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :radius, :float, default: 150.0
    add_column :users, :location, :string
  end
end

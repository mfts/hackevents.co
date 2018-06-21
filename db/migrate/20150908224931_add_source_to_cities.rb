class AddSourceToCities < ActiveRecord::Migration[4.2]
  def change
    add_column :cities, :source_url, :string
    add_column :cities, :source_name, :string
  end
end

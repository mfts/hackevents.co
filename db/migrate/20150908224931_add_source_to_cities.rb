class AddSourceToCities < ActiveRecord::Migration
  def change
    add_column :cities, :source_url, :string
    add_column :cities, :source_name, :string
  end
end

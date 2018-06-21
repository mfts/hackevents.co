class AddPrimaryColorToCategories < ActiveRecord::Migration[4.2]
  def change
    add_column :categories, :primary_color, :integer
  end
end

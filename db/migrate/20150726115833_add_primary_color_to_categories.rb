class AddPrimaryColorToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :primary_color, :integer
  end
end

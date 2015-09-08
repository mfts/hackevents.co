class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :hackathon_count
      t.integer :hackathon_total_count
      t.string :image_url

      t.timestamps null: false
    end
  end
end

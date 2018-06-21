class CreateCategorizations < ActiveRecord::Migration[4.2]
  def change
    create_table :categorizations do |t|
      t.integer :category_id
      t.integer :hackathon_id

      t.timestamps null: false
    end
  end
end

class CreateInterests < ActiveRecord::Migration[4.2]
  def change
    create_table :interests do |t|
      t.integer :user_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end

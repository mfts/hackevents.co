class CreateAffiliations < ActiveRecord::Migration[4.2]
  def change
    create_table :affiliations do |t|
      t.integer :user_id
      t.integer :sponsor_id

      t.timestamps null: false
    end
  end
end

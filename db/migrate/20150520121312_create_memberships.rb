class CreateMemberships < ActiveRecord::Migration[4.2]
  def change
    create_table :memberships do |t|
      t.integer :user_id
      t.integer :hackathon_id

      t.timestamps null: false
    end
  end
end

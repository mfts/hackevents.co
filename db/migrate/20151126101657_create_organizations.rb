class CreateOrganizations < ActiveRecord::Migration[4.2]
  def change
    create_table :organizations do |t|
      t.references :organizer, index: true
      t.references :organized_hackathon, index: true

      t.timestamps null: false
    end
    add_foreign_key :organizations, :hackathons, column: :organized_hackathon_id
    add_foreign_key :organizations, :users, column: :organizer_id
  end
end

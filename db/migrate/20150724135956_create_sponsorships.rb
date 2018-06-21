class CreateSponsorships < ActiveRecord::Migration[4.2]
  def change
    create_table :sponsorships do |t|
      t.integer :sponsor_id
      t.integer :hackathon_id

      t.timestamps null: false
    end
  end
end

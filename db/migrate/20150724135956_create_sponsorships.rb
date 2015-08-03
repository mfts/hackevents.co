class CreateSponsorships < ActiveRecord::Migration
  def change
    create_table :sponsorships do |t|
      t.integer :sponsor_id
      t.integer :hackathon_id

      t.timestamps null: false
    end
  end
end

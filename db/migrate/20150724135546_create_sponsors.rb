class CreateSponsors < ActiveRecord::Migration[4.2]
  def change
    create_table :sponsors do |t|
      t.string :twitter_handle
      t.string :twitter_image_url
      t.string :twitter_name
      t.string :alt_name

      t.timestamps null: false
    end
  end
end

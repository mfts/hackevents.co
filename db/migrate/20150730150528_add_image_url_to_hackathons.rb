class AddImageUrlToHackathons < ActiveRecord::Migration[4.2]
  def change
    add_column :hackathons, :image_url, :string
  end
end

class AddImageUrlToHackathons < ActiveRecord::Migration
  def change
    add_column :hackathons, :image_url, :string
  end
end

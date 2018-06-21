class AddSlugToHackathons < ActiveRecord::Migration[4.2]
  def change
    add_column :hackathons, :slug, :string
    add_index :hackathons, :slug
  end
end

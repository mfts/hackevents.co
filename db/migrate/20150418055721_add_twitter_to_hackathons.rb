class AddTwitterToHackathons < ActiveRecord::Migration[4.2]
  def change
    add_column :hackathons, :twitter, :string
  end
end

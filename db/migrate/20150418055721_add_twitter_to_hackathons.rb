class AddTwitterToHackathons < ActiveRecord::Migration
  def change
    add_column :hackathons, :twitter, :string
  end
end

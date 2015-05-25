class AddLatitudeToHackathons < ActiveRecord::Migration
  def change
    add_column :hackathons, :latitude, :float
  end
end

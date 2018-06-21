class AddLatitudeToHackathons < ActiveRecord::Migration[4.2]
  def change
    add_column :hackathons, :latitude, :float
  end
end

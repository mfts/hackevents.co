class AddLongitudeToHackathons < ActiveRecord::Migration[4.2]
  def change
    add_column :hackathons, :longitude, :float
  end
end

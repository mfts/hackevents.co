class AddLongitudeToHackathons < ActiveRecord::Migration
  def change
    add_column :hackathons, :longitude, :float
  end
end

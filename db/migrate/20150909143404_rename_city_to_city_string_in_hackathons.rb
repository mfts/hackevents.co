class RenameCityToCityStringInHackathons < ActiveRecord::Migration
  def change
    rename_column :hackathons, :city, :city_string
  end
end

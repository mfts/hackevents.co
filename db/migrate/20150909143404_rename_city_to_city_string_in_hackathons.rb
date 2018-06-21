class RenameCityToCityStringInHackathons < ActiveRecord::Migration[4.2]
  def change
    rename_column :hackathons, :city, :city_string
  end
end

class AddCityToHackathons < ActiveRecord::Migration[4.2]
  def change
    add_reference :hackathons, :city, index: true, foreign_key: true
  end
end

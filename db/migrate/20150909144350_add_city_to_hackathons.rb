class AddCityToHackathons < ActiveRecord::Migration
  def change
    add_reference :hackathons, :city, index: true, foreign_key: true
  end
end

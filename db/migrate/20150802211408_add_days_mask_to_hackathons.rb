class AddDaysMaskToHackathons < ActiveRecord::Migration[4.2]
  def change
    add_column :hackathons, :days_mask, :integer
  end
end

class AddDaysMaskToHackathons < ActiveRecord::Migration
  def change
    add_column :hackathons, :days_mask, :integer
  end
end

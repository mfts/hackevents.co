class AddHighlightedToHackathons < ActiveRecord::Migration
  def change
    add_column :hackathons, :highlighted, :boolean, default: false
  end
end

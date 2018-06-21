class AddHighlightedToHackathons < ActiveRecord::Migration[4.2]
  def change
    add_column :hackathons, :highlighted, :boolean, default: false
  end
end

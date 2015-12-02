class AddOrganizerToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :organizer, :boolean, default: false
  end
end

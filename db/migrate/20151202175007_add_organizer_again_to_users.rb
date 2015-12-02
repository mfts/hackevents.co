class AddOrganizerAgainToUsers < ActiveRecord::Migration
  def change
    add_column :users, :organizer, :boolean, default: false
  end
end

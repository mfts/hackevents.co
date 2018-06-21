class AddOrganizerAgainToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :organizer, :boolean, default: false
  end
end

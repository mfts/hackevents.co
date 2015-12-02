class AddOrganizerToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :organizer, :boolean, default: false unless Rails.env.production?
  end
end

class AddTeamToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :team, :boolean, default: false
    add_column :users, :support, :boolean, default: false
  end
end

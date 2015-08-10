class AddTeamToUsers < ActiveRecord::Migration
  def change
    add_column :users, :team, :boolean, default: false
    add_column :users, :support, :boolean, default: false
  end
end

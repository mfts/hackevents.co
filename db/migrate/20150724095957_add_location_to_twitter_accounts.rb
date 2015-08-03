class AddLocationToTwitterAccounts < ActiveRecord::Migration
  def change
    add_column :twitter_accounts, :location, :string
  end
end

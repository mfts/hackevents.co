class AddLocationToTwitterAccounts < ActiveRecord::Migration[4.2]
  def change
    add_column :twitter_accounts, :location, :string
  end
end

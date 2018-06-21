class AddUserIdColumnToTwitterAccounts < ActiveRecord::Migration[4.2]
  def change
    add_column :twitter_accounts, :user_id, :integer
    add_column :twitter_accounts, :username, :string
  end
end

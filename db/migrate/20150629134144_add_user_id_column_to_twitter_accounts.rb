class AddUserIdColumnToTwitterAccounts < ActiveRecord::Migration
  def change
    add_column :twitter_accounts, :user_id, :integer
    add_column :twitter_accounts, :username, :string
  end
end

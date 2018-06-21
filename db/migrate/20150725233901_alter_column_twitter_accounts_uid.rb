class AlterColumnTwitterAccountsUid < ActiveRecord::Migration[4.2]
  def self.up
    change_table :twitter_accounts do |t|
      t.change :uid, 'bigint USING CAST(uid AS bigint)'
    end
  end
  def self.down
    change_table :twitter_accounts do |t|
      t.change :uid, :string
    end
  end
end

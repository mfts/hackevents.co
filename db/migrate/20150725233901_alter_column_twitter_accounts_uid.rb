class AlterColumnTwitterAccountsUid < ActiveRecord::Migration
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

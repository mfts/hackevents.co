class CreateTwitterAccounts < ActiveRecord::Migration[4.2]
  def change
    create_table :twitter_accounts do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :description
      t.string :token
      t.string :secret
      t.string :profile_image
    end
  end
end

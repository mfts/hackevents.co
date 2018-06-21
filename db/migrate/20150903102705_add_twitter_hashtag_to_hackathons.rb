class AddTwitterHashtagToHackathons < ActiveRecord::Migration[4.2]
  def change
    add_column :hackathons, :twitter_hashtag, :string
  end
end

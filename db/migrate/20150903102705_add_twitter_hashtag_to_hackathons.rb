class AddTwitterHashtagToHackathons < ActiveRecord::Migration
  def change
    add_column :hackathons, :twitter_hashtag, :string
  end
end

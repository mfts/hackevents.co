class TwitterAccount < ActiveRecord::Base
  belongs_to :user

  #after_save :get_twitter_following, :get_twitter_followers
  
  # Twitter Integration
  def self.find_or_create_from_auth_hash(auth_hash)
    user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
    user.update(
      username: auth_hash.info.nickname,
      name: auth_hash.info.name,
      profile_image: auth_hash.info.image.gsub('_normal',''),
      description: auth_hash.info.description,
      location: auth_hash.info.location,
      token: auth_hash.credentials.token,
      secret: auth_hash.credentials.secret
    )
    user
  end

  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key = Rails.application.secrets.twitter_api_key
      config.consumer_secret = Rails.application.secrets.twitter_api_secret
      config.access_token = token
      config.access_token_secret = secret
    end
  end


  def get_twitter_following
    following_id_array = TwitterAccount.pluck(:uid) & client.friend_ids.to_a
    user_id_array = TwitterAccount.where(uid: following_id_array).pluck(:user_id)
    user_id_array.each do |id|
      unless self.user.following_user?(User.find_by(id: id))
        self.user.active_relationships.create(followed_id: id)
      end
    end
  end

  def get_twitter_followers
    follower_id_array = TwitterAccount.pluck(:uid) & client.follower_ids.to_a
    user_id_array = TwitterAccount.where(uid: follower_id_array).pluck(:user_id)
    user_id_array.each do |id|
      unless self.user.followed_by_user?(User.find_by(id: id))
        self.user.passive_relationships.create(follower_id: id)
      end
    end
  end

end

class TwitterAccount < ActiveRecord::Base
  belongs_to :user
  
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

  def getFriends
    # begin
      friendsList = client.friends
    # rescue Twitter::Error::TooManyRequests => error
    #   sleep error.rate_limit.reset_in + 1
    #   retry
    # end
  end

end

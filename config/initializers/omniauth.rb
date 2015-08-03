Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.application.secrets.twitter_api_key.blank? || Rails.application.secrets.twitter_api_secret.blank?
    warn '*' * 80
    warn 'WARNING: Missing consumer key or secret. First, register an app with Twitter at'
    warn 'https://dev.twitter.com/apps to obtain OAuth credentials. Then, start the server'
    warn 'with the command: CONSUMER_KEY=abc CONSUMER_SECRET=123 rails server'
    warn '*' * 80
  else
    provider :twitter, Rails.application.secrets.twitter_api_key, Rails.application.secrets.twitter_api_secret
  end
end

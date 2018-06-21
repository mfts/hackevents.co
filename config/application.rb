require_relative 'boot'

require 'csv'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Hackbook
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Do not swallow errors in after_commit/after_rollback callbacks.

    # ------- To be deleted --------
    # config.active_record.raise_in_transactional_callbacks = true
    # config.assets.paths << Rails.root.join("font")
    # config.assets.paths << "#{Rails.root}/app/assets/html"
    # config.assets.initialize_on_precompile = false
  end
end

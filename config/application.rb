require_relative 'boot'

require 'rails/all'
require 'openssl'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ShopManager
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    Rails.application.config.after_initialize do
      cipher = OpenSSL::Cipher.new('AES-256-CBC')
      ::CipherKey = cipher.random_key
      ::CipherIv = cipher.random_iv
    end
  end
end

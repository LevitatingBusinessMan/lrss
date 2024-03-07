require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

require "typhoeus/cache/rails"

module Lrss
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configure the caching mechanism for Typhoeus
    config.after_initialize do
      Typhoeus::Config.cache = Typhoeus::Cache::Rails.new Rails.cache, default_ttl: 300
    end

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end

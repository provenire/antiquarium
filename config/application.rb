require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Antiquarium
  class Application < Rails::Application
    # Enable Grape API
    config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]

    # Disable assets
    config.assets.enabled = false

    # Disable controller assets autogeneration
    config.generators do |g|
      g.assets false
    end

    # Configure ActiveJob
    config.active_job.queue_adapter = :delayed_job

    # Exceptions
    config.exceptions_app = self.routes

    # Cors
    config.middleware.insert_before 0, "Rack::Cors" do
      allow do
        origins ENV['CORS_ORIGINS']
        resource '*', :headers => :any, :methods => [:get, :put, :post, :options]
      end
    end
  end
end

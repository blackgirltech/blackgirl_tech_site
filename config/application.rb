require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
require "active_storage/engine"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.

Bundler.require(*Rails.groups)

module BlackgirlTechSite
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.enable_dependency_loading = true
    config.autoload_paths << Rails.root.join("lib")
    config.active_job.queue_adapter = :delayed_job
    config.serve_static_assets = true

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        resource '*', headers: :any, methods: :any
      end
    end
  end
end

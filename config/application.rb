require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
Bundler.require(*Rails.groups)

module Help
  class Application < Rails::Application
    config.load_defaults 5.2
    config.api_only = true    
    config.generators do |g|
      g.orm :active_record, primary_key_type: :uuid

      g.test_framework :rspec,
          view_specs: false,
          helper_specs: false,
          controller_specs: false,
          routing_specs: false
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
    end

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'http://localhost:8080'
    
        resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head]
      end
    end
  
  end
end

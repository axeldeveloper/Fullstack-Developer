require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module AppDesafio
  class Application < Rails::Application

    # config.generators do |generate|
    #   generate.assets false
    #   generate.helper false
    #   generate.test_framework :test_unit, fixture: false
    # end

    config.eager_load = true
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0


  end
end

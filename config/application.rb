require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Berserkers
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    
    config.autoload_paths += %W(#{config.root}/app)
    config.eager_load_paths += %W(#{config.root}/app)

    config.autoload_paths += %W(#{config.root}/lib/**/)
    config.autoload_paths += Dir["#{config.root}/lib/**/"]

    config.i18n.default_locale = :'pt-BR'
    config.i18n.available_locales = [:'pt-BR', :en]
    config.i18n.default_locale = :'pt-BR'
    config.i18n.enforce_available_locales = false

    config.time_zone = 'Brasilia'
    config.active_record.default_timezone = :local
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

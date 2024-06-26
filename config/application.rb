require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OtonoApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    config.i18n.available_locales = %w[es-CL es-MX es-GT es-SV es-BO es-EC es-HN en-US es-UY es-PE es-PA es-DO es en]
    config.i18n.default_locale = 'es-PE'
    config.i18n.fallbacks = {
      'es-CL' => 'es',
      'es-MX' => 'es',
      'es-GT' => 'es',
      'es-SV' => 'es-GT',
      'es-BO' => 'es',
      'es-EC' => 'es',
      'es-HN' => 'es',
      'en-US' => 'en',
      'es-UY' => 'es',
      'es-PE' => 'es',
      'es-PA' => 'es',
      'es-DO' => 'es'
    }
  end
end

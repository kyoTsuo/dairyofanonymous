require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Dairyofanonymous
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.generators do |g|
      g.test_framework :rspec,
        view_specs: false, # ビュースペックを作成するかどうか
        helper_specs: false, # ヘルパーファイル用のスペックを作成するかどうか
        routing_specs: false # config/routes.rb 用のスペックファイルを作成するかどうか　シンプルならば false で構わない
    end

    config.time_zone = 'Tokyo'
    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

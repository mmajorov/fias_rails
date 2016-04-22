module FiasRails
  class Engine < ::Rails::Engine
    puts "#{config.root}/app/models/fias/*"
    config.autoload_paths += Dir["#{config.root}/app/models/fias/*"]
  end
end
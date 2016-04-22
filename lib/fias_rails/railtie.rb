module FiasRails
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'tasks/fias_tasks.rake'
    end
  end
end

require 'fias_rails/engine' if defined?(Rails)

module FiasRails
end

module Fias
  def self.table_name_prefix
    'fias_'
  end
end

require 'rails/generators/migration'

module FiasRails
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)
      desc "add the migrations"

      def self.next_migration_number(path)
        unless @prev_migration_nr
          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        else
          @prev_migration_nr += 1
        end
        @prev_migration_nr.to_s
      end

      def copy_migrations
        migration_template "create_fias_actual_statuses.rb",	  "db/migrate/create_fias_actual_statuses.rb"
        migration_template "create_fias_address_objects.rb",	  "db/migrate/create_fias_address_objects.rb"
        migration_template "create_fias_address_object_types.rb", "db/migrate/create_fias_address_object_types.rb"
        migration_template "create_fias_center_statuses.rb",	  "db/migrate/create_fias_center_statuses.rb"
        migration_template "create_fias_current_statuses.rb",	  "db/migrate/create_fias_current_statuses.rb"
        migration_template "create_fias_estate_statuses.rb",	  "db/migrate/create_fias_estate_statuses.rb"
        migration_template "create_fias_house_objects.rb",	  "db/migrate/create_fias_house_objects.rb"
        migration_template "create_fias_house_state_statuses.rb", "db/migrate/create_fias_house_state_statuses.rb"
        migration_template "create_fias_interval_statuses.rb",	  "db/migrate/create_fias_interval_statuses.rb"
        migration_template "create_fias_operation_statuses.rb",	  "db/migrate/create_fias_operation_statuses.rb"
        migration_template "create_fias_structure_statuses.rb",	  "db/migrate/create_fias_structure_statuses.rb"
      end
    end
  end
end

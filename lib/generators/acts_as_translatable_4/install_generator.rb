require "rails/generators"

module ActsAsTranslatable4
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path('../templates', __FILE__)

      def install
        migration_template "migration.rb", "db/migrate/create_record_translations.rb"
      end
    end
  end
end
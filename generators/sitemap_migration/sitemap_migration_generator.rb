class SitemapMigrationGenerator < Rails::Generator::NamedBase
  attr_reader :sitemap_table_name
  def initialize(runtime_args, runtime_options = {})
    @sitemap_table_name = 'sitemap'
    runtime_args << 'add_sitemap_table' if runtime_args.empty?
    super
  end

  def manifest
    record do |m|
      m.migration_template 'migration.rb', 'db/migrate'
    end
  end
end


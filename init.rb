require 'sitemap'
require 'sitemap_fu'
ActiveRecord::Base.class_eval do
  include Queso::Acts::Sitemap
end
SitemapsController.view_paths = [File.join(directory, 'views')]
SitemapSettingsController.view_paths = [File.join(directory, 'views')]
SitemapWidgetsController.view_paths = [File.join(directory, 'views')]
SitemapStaticLinksController.view_paths = [File.join(directory, 'views')]
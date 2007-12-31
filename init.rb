require 'sitemap'
require 'sitemap_fu'
SitemapsController.view_paths = [File.join(directory, 'views')]
SitemapSettingsController.view_paths = [File.join(directory, 'views')]
SitemapWidgetsController.view_paths = [File.join(directory, 'views')]
SitemapStaticLinksController.view_paths = [File.join(directory, 'views')]
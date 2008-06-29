require 'sitemap'
require 'sitemap_fu'
require "#{directory}/app/controllers/sitemap_plugin_controller"
%w|models controllers|.each { |d| Dir["#{directory}/app/#{d}/*"].each { |f| require f.gsub(/\.rb/,'') } }
ActiveRecord::Base.class_eval do
  include Queso::Acts::Sitemap
end
SitemapsController.view_paths = [File.join(directory, 'app/views')]
SitemapSettingsController.view_paths = [File.join(directory, 'app/views')]
SitemapWidgetsController.view_paths = [File.join(directory, 'app/views')]
SitemapStaticLinksController.view_paths = [File.join(directory, 'app/views')]
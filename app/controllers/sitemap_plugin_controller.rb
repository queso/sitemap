class SitemapPluginController < ActionController::Base
  layout 'sitemap_plugin'
  before_filter :check_sitemap_auth
  
  def check_sitemap_auth

  end
  
end
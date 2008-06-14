class SitemapPluginController < ActionController::Base
  layout 'sitemap_plugin'
  before_filter :check_sitemap_auth
  
  protected
  
  def check_sitemap_auth
    
  end
  
end
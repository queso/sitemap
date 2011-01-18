class SitemapPluginController < ApplicationController
  unloadable
  layout 'sitemap_plugin'
  before_filter :check_sitemap_auth
  
  def check_sitemap_auth
    settings = SitemapSetting.find(:first)
    return unless settings && (!settings.username.blank? && !settings.password.blank?)
    authenticate_or_request_with_http_basic do |username, password|
      username == settings.username && password == settings.password
    end
  end
  
end
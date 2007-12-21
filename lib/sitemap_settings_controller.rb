class SitemapSettingsController < ActionController::Base

  def index
    @settings = SitemapSetting.find(:first) || SitemapSetting.create()
  end
  
  def widgets
    @widgets = SitemapWidget.find(:all)
  end
  
  def static_links
    @static_links = SitemapStaticLink.find(:all)
  end

end
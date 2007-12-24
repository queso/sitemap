class SitemapSettingsController < ActionController::Base

  def index
    @settings = SitemapSetting.find(:first) || SitemapSetting.create()
  end
  
  def update
    @settings = SitemapSetting.find(:first)
    if @settings.update_attributes(params[:sitemap_setting])
      redirect_to sitemap_settings_url
    end
  end
  
  def widgets
    @widgets = SitemapWidget.find(:all)
  end
  
  def static_links
    @static_links = SitemapStaticLink.find(:all)
  end

end
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
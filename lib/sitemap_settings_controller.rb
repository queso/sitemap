class SitemapSettingsController < SitemapPluginController

  def index
    @settings = SitemapSetting.find(:first) || SitemapSetting.create()
  end
  
  def update
    @settings = SitemapSetting.find(:first)
    if @settings.update_attributes(params[:sitemap_setting])
      redirect_to sitemap_settings_url
    end
  end
  
  def static_links
    @static_links = SitemapStaticLink.find(:all)
  end

end

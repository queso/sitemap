class SitemapsController < ActionController::Base
  
  def show
    s = Queso::SEO::Sitemap.new
    @widgets = s.widgets
    @sitemap_config = s.sitemap_config
    @site = SitemapSetting.find(:first)
    @static_links = s.static_links
    respond_to do |format|
      format.html
      format.xml {render :template => "show.xml.builder", :layout => false}
      format.css
      format.xsl
    end
  end
  
end
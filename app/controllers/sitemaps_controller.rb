class SitemapsController < ActionController::Base
  
  def show
    @widgets = SitemapWidget.find(:all)
    @site = SitemapSetting.find(:first)
    @static_links = SitemapStaticLink.find(:all)
    respond_to do |format|
      format.html
      format.xml
      format.css
      format.xsl
    end
  end
  
end
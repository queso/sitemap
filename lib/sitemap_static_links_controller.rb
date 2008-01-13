class SitemapStaticLinksController < ActionController::Base
  layout "sitemap_plugin"
  
  def index
    @static_links = SitemapStaticLink.find(:all)
  end
  
  def edit
    @static_link = SitemapStaticLink.find(params[:id])
  end
  
  def update
    @static_link = SitemapStaticLink.find(params[:id])
    if @static_link.update_attributes(params[:sitemap_static_link])
      redirect_to sitemap_static_links_url
    end
  end
  
  def create
    @static_link = SitemapStaticLink.new(params[:sitemap_static_link])
    if @static_link.save
      redirect_to sitemap_static_links_url
    end
  end
  
  def new
    @static_link = SitemapStaticLink.new()
  end
  
end
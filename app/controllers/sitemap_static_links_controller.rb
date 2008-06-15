class SitemapStaticLinksController < SitemapPluginController
  before_filter :find_static_link, :only => [:edit, :update, :destroy]
  
  def index
    @static_links = SitemapStaticLink.find(:all)
  end
  
  def edit
    
  end
  
  def update
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
  
  def destroy
    if @static_link.destroy
      redirect_to sitemap_static_links_url
    end
  end
  
  protected
  def find_static_link
    @static_link = SitemapStaticLink.find(params[:id])
  end
  
end
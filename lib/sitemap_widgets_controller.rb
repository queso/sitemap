class SitemapWidgetsController < ActionController::Base
  layout "sitemap_plugin"
  
  def index
    @widgets = SitemapWidget.find(:all)
  end
  
  def edit
    @widget = SitemapWidget.find(params[:id])
  end
  
  def update
    @widget = SitemapWidget.find(params[:id])
    if @widget.update_attributes(params[:sitemap_widget])
      redirect_to sitemap_widgets_url
    end
  end
  
  def create
    @widget = SitemapWidget.new(params[:sitemap_widget])
    if @widget.save
      redirect_to sitemap_widgets_url
    end
  end
  
  def new
    @widget = SitemapWidget.new()
  end
  
end
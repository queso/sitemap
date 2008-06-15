class SitemapWidgetsController < SitemapPluginController
  before_filter :find_widget, :only => [:edit, :update, :destroy]
  
  def index
    @widgets = SitemapWidget.find(:all)
  end
  
  def edit
  end
  
  def update
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
  
  def destroy
    if @widget.destroy
      redirect_to sitemap_widgets_url
    end
  end
  
  protected
  def find_widget
    @widget = SitemapWidget.find(params[:id])
  end
  
end
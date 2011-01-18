class SitemapsController < ActionController::Base
  unloadable
  
  def show
    @rendering_start_time = Time.now
    @widgets = SitemapWidget.find(:all)
    @site = SitemapSetting.find(:first)
    @static_links = SitemapStaticLink.find(:all)
    respond_to do |format|
      format.html
      format.xml do
        if @site.use_index?
          render :index
        else
          render :show
        end
      end
      format.css
      format.xsl do
        if @site.use_index?
          render :index
        else
          render :show
        end
      end
    end
  end
  
  def show_widget
    @rendering_start_time = Time.now
    @widget = SitemapWidget.find(:first, :conditions => ["widget_model = ?", params[:id]])
    respond_to do |format|
      format.xml
      format.xsl { render :show }
    end
  end
  
end
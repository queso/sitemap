class SitemapsController < ActionController::Base
  layout nil
  
  def show
    s = Queso::SEO::Sitemap.new
    @widgets = s.widgets
    @sitemap_config = s.sitemap_config
    respond_to do |format|
      format.xml {render :template => "show.xml.builder"}
    end
  end
  
end
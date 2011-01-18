xml.instruct! :"xml-stylesheet", :type=>"text/xsl", :href=>"/sitemap/sitemap.xsl"

xml.urlset "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance", "xsi:schemaLocation" => "http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/siteindex.xsd", "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  
  xml.url do
    xml.loc         url_for(send(@widget.index_named_route.to_sym))
    xml.lastmod     w3c_date(Time.now)
    xml.changefreq  @widget.frequency_index
    xml.priority    @widget.priority
  end
  
  @widget.find_children.each do |child|
    xml.url do
      xml.loc         polymorphic_url(child)
      xml.lastmod     w3c_date(child.updated_at || Time.now)
      xml.changefreq  @widget.frequency_show
      xml.priority    @widget.priority
    end
  end

end
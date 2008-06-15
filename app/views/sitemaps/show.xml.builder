xml.instruct! :"xml-stylesheet", :type=>"text/xsl", :href=>"sitemap.xsl"

xml.urlset "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance", "xsi:schemaLocation" => "http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/siteindex.xsd", "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  xml.url do
    xml.loc         url_for(root_url)
    xml.lastmod     w3c_date(Time.now)
    xml.changefreq  "always"
    xml.priority    1.0
  end

  xml.url do
    xml.loc         url_for(sitemap_url)
    xml.lastmod     w3c_date(Time.now)
    xml.changefreq  "always"
    xml.priority    1.0
  end  
  
  @static_links.each do |static_link|
    xml.url do
      xml.loc         url_for(send(static_link.url.to_sym))
      xml.lastmod     w3c_date(Time.now)
      xml.changefreq  static_link.frequency
      xml.priority    static_link.priority
    end 
  end

  
@widgets.each do |widget|
  xml.url do
    xml.loc         url_for(send(widget.index_named_route.to_sym))
    xml.lastmod     w3c_date(Time.now)
    xml.changefreq  widget.frequency_index
    xml.priority    widget.priority
  end
  
  widget.find_children.each do |child|
      xml.url do
        xml.loc         polymorphic_url(child)
        xml.lastmod     w3c_date(child.updated_at || Time.now)
        xml.changefreq  widget.frequency_show
        xml.priority    widget.priority
      end
  end
end

end
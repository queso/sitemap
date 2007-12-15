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
  
@static_links.each_key do |k|
  @static_links[k].each do |key, static_link|
    xml.url do
      xml.loc         url_for(send(@static_links[k][key]["url"].to_sym))
      xml.lastmod     w3c_date(Time.now)
      xml.changefreq  static_link["frequency"]
      xml.priority    static_link["prioity"]
    end 
  end
end
  
@widgets.each_key do |k|
  xml.url do
    xml.loc         url_for(send(@sitemap_config[:widgets][k]["index_named_route"].to_sym))
    xml.lastmod     w3c_date(Time.now)
    xml.changefreq  @sitemap_config[:widgets][k]["frequency_index"]
    xml.priority    @sitemap_config[:widgets][k]["prioity"]
  end
  
  @widgets[k].each do |widget|
      xml.url do
        xml.loc         polymorphic_url(widget)
        xml.lastmod     w3c_date(widget.updated_at || Time.now)
        xml.changefreq  @sitemap_config[:widgets][k]["frequency_show"]
        xml.priority    @sitemap_config[:widgets][k]["prioity"]
      end
  end
end

end
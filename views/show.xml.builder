xml.instruct!

xml.urlset "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance", "xsi:schemaLocation" => "http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/siteindex.xsd", "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  xml.url do
    xml.loc         url_for(root_url)
    xml.lastmod     w3c_date(Time.now)
    xml.changefreq  "always"
  end
  
@widgets.each_key do |k|
  xml.url do
    xml.loc         url_for(send(@sitemap_config[k]["index_named_route"].to_sym))
    xml.lastmod     w3c_date(Time.now)
    xml.changefreq  @sitemap_config[k]["frequency_index"]
    xml.priority    @sitemap_config[k]["prioity"]
  end
  
  @widgets[k].each do |widget|
      xml.url do
        xml.loc         polymorphic_url(widget)
        xml.lastmod     w3c_date(widget.updated_at || Time.now)
        xml.changefreq  @sitemap_config[k]["frequency_show"]
        xml.priority    @sitemap_config[k]["prioity"]
      end
  end
end

end
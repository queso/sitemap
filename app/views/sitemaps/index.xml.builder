xml.instruct! :"xml-stylesheet", :type=>"text/xsl", :href=>"sitemap.xsl"

xml.sitemapindex "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance", "xsi:schemaLocation" => "http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/siteindex.xsd", "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  
  @static_links.each do |static_link|
    xml.sitemap do
      xml.loc         url_for(send(static_link.url.to_sym))
      xml.lastmod     w3c_date(Time.now)
    end 
  end

  
@widgets.each do |widget|
  
  xml.sitemap do
    xml.loc         url_for(individual_sitemap_url((widget.widget_model_name + ".xml").to_sym))
    xml.lastmod     w3c_date(Time.now)
  end
  
end

end
ActionController::Routing::Routes.draw do |map|
  map.resource :sitemap
  map.resources :sitemap_settings
  map.resources :sitemap_widgets
  map.resources :sitemap_static_links
  map.individual_sitemap "/sitemap/:id.:format", :controller => "sitemaps", :action => "show_widget"
end
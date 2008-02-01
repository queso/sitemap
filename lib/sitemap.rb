Mime::Type.register_alias "text/xml", :xsl


class << ActionController::Routing::Routes;self;end.class_eval do
  define_method :clear!, lambda {}
end

ActionController::Routing::Routes.draw do |map|
  map.resource :sitemap
  map.resources :sitemap_settings
  map.resources :sitemap_widgets
  map.resources :sitemap_static_links
end

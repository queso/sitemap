Mime::Type.register_alias "text/xml", :xsl

module Queso
  module SEO
    
    class ConfigFileNotFoundError < StandardError; end
    
    class Sitemap
      attr_accessor :sitemap_config
    
      def initialize(file = '/config/sitemap.yml') #:nodoc:
        begin
          path = RAILS_ROOT + file
          @sitemap_config = YAML.load_file(path).symbolize_keys
        rescue
          raise ConfigFileNotFoundError.new('File %s not found' % path )
        end
      end
    
      def widgets
        widgets = {}
        sitemap_config[:widgets].each_key do |k|
          widgets[k] = find_widgets(sitemap_config[:widgets][k]["model"].constantize)
        end
        widgets
      end
    
      def find_widgets(widget_model, options = {})
        widget_model.find(:all, options)
      end
      
      def site
        site = sitemap_config[:site].symbolize_keys
      end
      
      def static_links
        static_links = sitemap_config[:static_links].symbolize_keys
      end
      
    end
  end
end

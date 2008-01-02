module Queso
  module Acts
    module Sitemap
   
      def self.included(base)
        base.extend ClassMethods  
      end
      
      module ClassMethods
        
        def has_sitemap
          after_save :ping_all_search_engines
          include Queso::Acts::Sitemap::InstanceMethods
        end
        
      end
      
      module InstanceMethods
        require 'open-uri'
        
        def ping_all_search_engines
          return true
          ensure
            ping_search_engine(google.com)
        end
        
        def ping_search_engine(url)
          if location = SitemapSetting.xml_location
            open("http://#{url}//ping?sitemap=#{location}")
          end
        end
        
      end
    end
  end
end

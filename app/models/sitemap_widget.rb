class SitemapWidget < ActiveRecord::Base
  
  def self.priorities
    [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]
  end
  
  def self.frequencies
    [["Always", "always"], ["Daily", "daily"], ["Weekly", "weekly"], ["Monthly", "monthly"], ["Yearly", "yearly"]]
  end

  def find_children(options = {})
    @finder = finder
    widget_model_constant.send @finder, :all, options
  end
  
  def widget_model_constant
    widget_model.constantize
  end
  
  def finder
    method = (custom_finder.blank? || custom_finder.nil?) ? "find" : custom_finder.to_s
    method.to_sym
  end
  
end

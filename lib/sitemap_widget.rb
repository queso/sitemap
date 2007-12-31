class SitemapWidget < ActiveRecord::Base
  
  def self.priorities
    [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]
  end
  
  def self.frequencies
    {"Always" => "always", "Daily" => "daily", "Weekly" => "weekly", "Monthly" => "monthly", "Yearly" => "yearly"}
  end

  def find_children(options = {})
    widget_model_contstant.find(:all, options)
  end
  
  def widget_model_constant
    widget_model.constantize
  end
  
end

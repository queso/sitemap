class <%= class_name %> < ActiveRecord::Migration
  def self.up
    create_table "<%= sitemap_table_name %>_settings", :force => true do |t|
      t.string :name
      t.string :description
      t.string :xml_location
      t.string :username
      t.string :password
    
      t.timestamps
    end
    
    create_table "<%= sitemap_table_name %>_static_links", :force => true do |t|
      t.string :url
      t.string :name
      t.float :priority
      t.string :frequency
      t.string :section
      
      t.timestamps
    end
    
    create_table "<%= sitemap_table_name %>_widgets", :force => true do |t|
      t.string :widget_model
      t.string :index_named_route
      t.string :frequency_index
      t.string :frequency_show
      t.float :priority
      t.string :custom_finder
      
      t.timestamps
    end
    
  end

  def self.down
    drop_table "<%= sitemap_table_name %>_settings"
    drop_table "<%= sitemap_table_name %>_static_links"
    drop_table "<%= sitemap_table_name %>_widgets"
  end
end

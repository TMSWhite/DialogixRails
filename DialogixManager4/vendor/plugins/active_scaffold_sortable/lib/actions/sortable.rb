module ActiveScaffold::Actions
  module Sortable
    
    def self.included(base)
      base.helper_method :sort_params
      
      configure_for_sortable(base)
    end
    
    def self.configure_for_sortable(base)
      config = base.active_scaffold_config
      config.list.per_page = 9999 # disable pagination
      
      sortable_plugin_path = File.join(RAILS_ROOT, 'vendor', 'plugins', sortable_plugin_name, 'views')
      
      if base.respond_to?(:generic_view_paths) && ! base.generic_view_paths.empty?
        base.generic_view_paths.insert(0, sortable_plugin_path)
        puts base.generic_view_paths.inspect
      else  
        config.inherited_view_paths << sortable_plugin_path
      end
      
      
      # turn sorting off
      sortable_column = config.sortable.column.to_sym
      force_sort_on(sortable_column, config)
      
      [config.list, config.update, config.create].each{|ucl|
        ucl.columns.exclude sortable_column
      }
      
    end
    
    def self.force_sort_on(column, config)
      config.columns.each{|c| 
        c.sort = false unless c.name == column 
      }
      config.list.sorting = { column => "asc" }
    end
    
    def self.sortable_plugin_name
      # extract the name of the plugin as installed
      /.+vendor\/plugins\/(.+)\/lib/.match(__FILE__)
      plugin_name = $1
    end
    
    def reorder
      id_list = params[active_scaffold_tbody_id].map{|i| i.gsub(/[^0-9]/, '').to_i}
      id_list.each_index{|i|
        active_scaffold_config.model.update_all("#{active_scaffold_config.sortable.column}=#{i.to_i}", ["id = ?", id_list[i]])
      }
      render :update do |page|
        page << "ActiveScaffold.stripe('#{active_scaffold_tbody_id}');"
      end
    end
    
  protected
    def sort_params
      [
        "#{active_scaffold_tbody_id}", 
        {
          :tag => "tr", 
          :url => {:action => :reorder } 
        }
      ]
    end
  end
  
end

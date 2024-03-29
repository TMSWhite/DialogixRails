require File.dirname(__FILE__)+ '/lib/exceptions'
##
## Check for dependencies
##

version = Rails::VERSION::STRING.split(".")
if version[0] < "1" or (version[0] == "1" and version[1] < "2")
  message = <<-EOM
    ************************************************************************
    Rails 1.2.1 or greater is required. Please remove ActiveScaffold or
    upgrade Rails. After you upgrade Rails, be sure to run

    > rake rails:update:javascripts

    to get the newest prototype.js.
    ************************************************************************
  EOM
  ActionController::Base::logger.error message
  puts message
  raise ActiveScaffold::DependencyFailure
end

begin
  Paginator rescue require('paginator')
end

##
## Load the library
##
require File.dirname(__FILE__)+ '/lib/active_scaffold'
require File.dirname(__FILE__)+ '/lib/configurable'
require File.dirname(__FILE__)+ '/lib/finder'
require File.dirname(__FILE__)+ '/lib/constraints'
require File.dirname(__FILE__)+ '/lib/attribute_params'
require File.dirname(__FILE__)+ '/lib/active_record_permissions'
require File.dirname(__FILE__)+ '/lib/responds_to_parent'

##
## Autoloading for some directories
## (this could probably be optimized more -lance)
##
def autoload_dir(directory, namespace)
  Dir.entries(directory).each do |file|
    next unless file =~ /\.rb$/
    if file =~ /^[a-z_]+\.rb$/
      constant = File.basename(file, '.rb').camelcase
      eval(namespace).autoload constant, File.join(directory, file)
    else
      message = "ActiveScaffold: could not autoload #{File.join(directory, file)}"
      RAILS_DEFAULT_LOGGER.error message
      puts message
    end
  end
end
[:config, :actions, :data_structures].each do |namespace|
  ActiveScaffold.class_eval "module #{namespace.to_s.camelcase}; end"
  autoload_dir "#{File.dirname __FILE__}/lib/#{namespace}", "ActiveScaffold::#{namespace.to_s.camelcase}"
end

##
## Preload other directories
##
Dir["#{File.dirname __FILE__}/lib/extensions/*.rb"].each { |file| require file }
Dir["#{File.dirname __FILE__}/lib/helpers/*.rb"].each do |file|
  require file unless ['view_helpers.rb', 'controller_helpers.rb'].include? File.basename(file)
end
require File.dirname(__FILE__)+ '/lib/helpers/view_helpers'
require File.dirname(__FILE__)+ '/lib/helpers/controller_helpers'

## 
## Load the bridge infrastructure
## 
require File.dirname(__FILE__)+ '/lib/bridges/bridge.rb'


##
## Inject includes for ActiveScaffold libraries
##
ActionController::Base.send(:include, ActiveScaffold)
ActionController::Base.send(:include, RespondsToParent)
ActionController::Base.send(:include, ActiveScaffold::Helpers::ControllerHelpers)
ActionView::Base.send(:include, ActiveScaffold::Helpers::ViewHelpers)


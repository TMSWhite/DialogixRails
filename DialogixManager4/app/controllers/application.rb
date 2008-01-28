# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'dd834f93dd206510b67fb8eeffca78d9'
  ActiveScaffold.set_defaults do |config|
    config.actions.add :export
    config.export_force_quotes = true
    
  end
end

# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  session :session_key => '_sellit_session_id'

  helper :all # include all helpers, all the time
  protect_from_forgery :secret => '8c3e099237e6366fd2f5366e9c430e79'

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end

# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  
  # use it like this in controllers:
  #     before_filter :adjust_format_for_mobile, :only => ["show", "index"]
  #
  # For more help: http://contentfree.com/giving-back/is-it-mobile
  def adjust_format_for_mobile
    include IsItMobile::ForRails
  end

  
end

# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  helper_method :current_user_session, :current_user
  
  
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  
  # use it like this in controllers:
  #     before_filter :adjust_format_for_mobile, :only => ["show", "index"]
  #
  # For more help: http://contentfree.com/giving-back/is-it-mobile
  def adjust_format_for_mobile
    include IsItMobile::ForRails
  end

private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def require_no_user
    if current_user
      flash[:notice] = "You must be logged out to access this page"
      redirect_to "/"
      return false
    end
  end
  
  def require_user
    p "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
    if current_user.nil?
      p current_user.inspect
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_user_session_url
      return false
    end
  end
  
  
end

class ApplicationController < ActionController::Base
  protect_from_forgery
  
#        def current_user
#            return unless session [:user_id]
#            @current_user ||= User.find_by_id(session[:user_id])
#        end
        
#        helper_method :current_user
end

class ApplicationController < ActionController::Base
  helper_method :current_user, :admin_user
    
  def current_user
    if session[:user_id]
      @current_user ||= Passenger.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def admin_user
    if session[:admin_id]
      @admin_user ||= Admin.find(session[:admin_id])
    else
      @admin_user = nil
    end
  end

end

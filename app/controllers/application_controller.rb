class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    #need if so it doesn't blow up of there's no session
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end

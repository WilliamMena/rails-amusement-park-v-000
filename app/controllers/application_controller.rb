class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    if !session[:user_id].nil?
      @user ||= User.find(session[:user_id])
    else
      false
    end
  end

  def logged_in?
    !!current_user
  end

  helper_method :current_user, :logged_in?

end

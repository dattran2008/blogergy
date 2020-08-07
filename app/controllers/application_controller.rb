class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    #memoization
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    #need a bolean to check if already login
    !!current_user
  end

  def require_login
    if !logged_in?
      flash[:danger] = "You must login first before you can access!"
      redirect_to root_path
    end
  end
end

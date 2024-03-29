class ApplicationController < ActionController::Base
  private

  def login(user)
    session[:user_id] = user.id
    Current.user = user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def user_signed_in?
    !!current_user
  end
  helper_method :user_signed_in?

  def authenticate_user!
    redirect_to new_session_path, alert: 'Please log in' unless user_signed_in?
  end
end

class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :current_cart
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

  def require_admin
    unless current_user&.admin?
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end
  def current_cart
    if session[:cart_id]
      cart = Cart.find_by(:id => session[:cart_id])
      if cart.present?
        @current_cart = cart
      else
        session[:cart_id] = nil
      end
    end

    if session[:cart_id] == nil
      user_id = session[:user_id]
      @current_cart = Cart.create(user_id:user_id)
      session[:cart_id] = @current_cart.id
    end
    @current_cart
  end
end

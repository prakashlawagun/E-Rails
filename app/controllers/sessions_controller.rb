class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate_by(email: params[:email], password: params[:password])
    if user
      login user
      redirect_to root_path, notice: "You have signed successfully."
    else
      flash[:alert] = "Invalid email or password."
      render :new, status: :unprocessable_entity
    end
  end
  def destroy
    logout_user
    redirect_to root_path, alert: "You have been logged out."
  end

  private

  def logout_user
    reset_session
    Current.user = nil
  end
end
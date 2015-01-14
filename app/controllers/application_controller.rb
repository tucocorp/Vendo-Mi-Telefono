class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :authenticate_user!

  protected

  def configure_permitted_parameters
    # devise_parameter_sanitizer.for(:sign_in) do |u|
    #   u.permit(:login, :email, :password, :remember_me)
    # end

    # devise_parameter_sanitizer.for(:sign_up) do |u|
    #   u.permit(:username, :address,:contact_number, :email, :password, :password_confirmation)
    # end

    devise_parameter_sanitizer.for(:account_update) do |u| 
      u.permit(:username, :email, :password, :password_confirmation, :current_password)
    end
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def authenticate_admin!
    unless current_user && current_user.admin?
      flash[:alert] = "You aren't authorized to do that."
      redirect_to root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit({roles: [] }, :email, :name, :password, :password_confirmation)
    end
  end
end

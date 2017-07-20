class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do
    redirect_to root_path, alert: "Acces dinai"
  end

  protected


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :addres, :date_of_birth, :gender])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :addres, :date_of_birth, :gender])
  end
end

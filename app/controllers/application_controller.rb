class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit::Authorization

  # ...

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :gender, :birth_date, :about])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :gender, :birth_date, :about])
  end
end

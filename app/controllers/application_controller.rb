class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :store_current_location, unless: :devise_controller?


  def admin?
    if current_user && current_user.admin?
      true
    else
      false
    end
  end

  def volunteer?
    if current_user && current_user.volunteer?
      true
    else
      false
    end
  end

  private

  def store_current_location
    store_location_for(:user, request.url)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :subscription => []])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, subscription: []])
  end
end

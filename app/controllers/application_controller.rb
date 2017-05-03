class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :store_current_location, unless: :devise_controller?


  def admin?
    current_user && current_user.admin?
  end

  def volunteer?
    current_user && current_user.volunteer?
  end

  def subscribed_user?
    current_user && current_user.active_subscription?
  end

  private

  def store_current_location
    store_location_for(:user, request.url)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address_line_one, :address_line_two, :city, :postcode, :subscription => []])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :address_line_one, :address_line_two, :city, :postcode, subscription: []])
  end
end

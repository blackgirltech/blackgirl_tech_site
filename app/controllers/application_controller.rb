class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :store_current_location, unless: :devise_controller?


  def admin?
    current_member && current_member.admin?
  end

  def volunteer?
    current_member && current_member.volunteer?
  end

  def tutor?
    current_member && current_member.tutor?
  end

  def active_member?
    current_member && current_member.active_membership?
  end

  def convert_to_pence(number)
    number * 100
  end

  private

  def store_current_location
    store_location_for(:member, request.url)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address_line_one, :address_line_two, :city, :postcode, :volunteer, :tutor, :membership => []])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :address_line_one, :address_line_two, :city, :postcode, :volunteer, :tutor, membership: []])
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_current_location, unless: :devise_controller?


  def admin?
    current_member && current_member.admin?
  end

  def authenticate_admin!
    authenticate_member!
    unless current_member.admin?
      redirect_to root_path
    end
  end

  def volunteer?
    current_member && current_member.volunteer?
  end

  def tutor?
    current_member && current_member.tutor?
  end

  def convert_to_pence(n)
    (n.to_f * 100).to_i
  end

  def convert_to_pounds(n)
    n.to_f / 100
  end

  private

  def store_current_location
    store_location_for(:member, request.url)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address_line_one, :address_line_two, :city, :postcode, :volunteer, :contact_permission, :black_woman_nbp, :skill_list, :interest_list])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :address_line_one, :address_line_two, :city, :postcode, :volunteer, :contact_permission, :black_woman_nbp, :skill_list, :interest_list])
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:first_name, :last_name, :address_line_one, :address_line_two, :city, :postcode, :volunteer, :contact_permission, :black_woman_nbp, :skill_list, :interest_list])
  end
end

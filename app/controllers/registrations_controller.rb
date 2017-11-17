class RegistrationsController < Devise::RegistrationsController

  def destroy
    donation = resource.donations.where(active_regular_donation: true).first
    if donation
      cancel = CancelRegularDonation.new
      cancel.cancel(donation.id, resource)
    end
    resource.donations.delete_all
    super
  end

  # protected

  # # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   new_user_subscription_path(:user_id)
  # end

  # # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   new_user_subscription_path(:user_id)
  # end
end

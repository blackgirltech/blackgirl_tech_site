class RegistrationsController < Devise::RegistrationsController

  def destroy
    exp_sub = resource.most_recent_membership
    if exp_sub.paid?
      cancel = CancelMembership.new
      cancel.cancel(resource)
    end
    resource.memberships.delete_all
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

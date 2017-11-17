class MembershipsController < ApplicationController


  def cancel
    canellation = CancelMembership.new
    canellation.cancel(params[:membership_id], current_member)
    redirect_to current_member
  end

  # Membership checkout/show pages


  private

  def membership_params
    params.permit(:member_id, :membership_type, :response_id, :redirect_url)
  end

  def create_and_redirect(member, membership)
    stripe_subscription = CreateMembership.new
    stripe_subscription.create(member, membership, params[:stripe_source])
    redirect_to current_member
  end

end

class DonationsController < ApplicationController

  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.create(donation_params)
    if params[:one_off]
      amount = params[:amount] ? params[:amount] : params[:other_amount]
      CreateDonation.new.create_one_off_donation(params[:stripe_source], convert_to_pence(amount))
    elsif params[:regular]
      # pass plan to below
      unless @donation.active_regular_donation
        CreateDonation.new.create_regular_donation(current_member, params[:stripe_source], @donation)
      end
    end
    # redirect_to thank_you_page
    redirect_to root_path
  end

  def cancel
    canellation = CancelRegularDonation.new
    canellation.cancel(params[:donation_id], current_member)
    redirect_to current_member
  end

  private
  def donation_params
    params.permit(:amount, :email, :one_off, :regular, :member_id, :stripe_subscription_id, :active_regular_donation)
  end

end

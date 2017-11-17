class DonationsController < ApplicationController

  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.create(donation_params)
    if params[:one_off]
      CreateDonation.new.create_one_off_donation(params[:stripe_source], convert_to_pence(params[:amount].to_i))
    elsif params[:regular]
      # pass plan to below
      CreateDonation.new.create_regular_donation(current_member, params[:stripe_source], @donation)
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
    params.permit(:amount, :email, :one_off, :regular, :member_id, :stripe_subscription_id)
  end

end

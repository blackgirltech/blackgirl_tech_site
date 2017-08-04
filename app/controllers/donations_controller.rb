class DonationsController < ApplicationController

  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.create(donation_params)
    create_donation
    redirect_to root_path
  end

  def create_donation
    token = params[:stripe_token]
    amount = convert_to_pence(params[:amount].to_i)

    # Charge the user's card:
    donation = Stripe::Charge.create(
      :amount => amount,
      :currency => "gbp",
      :description => "Donation",
      :source => token,
    )
  end

  def donation_params
    params.permit(:amount, :email)
  end

end

class DonationsController < ApplicationController

  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.create(donation_params)
    CreateDonation.new.create_donation(params[:stripe_source], convert_to_pence(params[:amount].to_i))
    redirect_to root_path
  end

  private
  def donation_params
    params.permit(:amount, :email)
  end

end

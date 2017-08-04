class DonationsController < ApplicationController

  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.create(donation_params)
    create_donation(params[:stripe_token], params[:amount])
    redirect_to root_path
  end

  private
  def donation_params
    params.permit(:amount, :email)
  end

end

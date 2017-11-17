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
      CreateDonation.new.create_regular_donation(current_member, params[:stripe_source])
    end
    # redirect_to thank_you_page
    redirect_to root_path
  end

  private
  def donation_params
    params.permit(:amount, :email, :one_off, :regular, :member_id)
  end

end

class DonationsController < ApplicationController

  def new
    @donation = Donation.new
  end

  def create
    amount = calculate_amount(params)
    one_off = params[:donation][:one_off]
    regular = params[:donation][:regular]
    @donation = Donation.new(donation_params)
    @donation.amount = amount
    @donation.save!
    if  one_off || (one_off.nil? && regular.nil?)
      CreateDonation.new.create_one_off_donation(convert_to_pence(amount), params[:stripe_source])
    elsif regular
      unless @donation.active_regular_donation
        CreateDonation.new.create_regular_donation(current_member, params[:stripe_source], @donation, convert_to_pence(amount))
      end
    end
    redirect_to thank_you_path
  end

  def cancel
    canellation = CancelRegularDonation.new
    canellation.cancel(params[:donation_id], current_member)
    redirect_to current_member
  end

  def thank_you

  end

  private

  def calculate_amount(params)
    if params[:amount5]
      amount = 5
    elsif params[:amount10]
      amount = 10
    elsif params[:amount15]
      amount = 15
    else
      amount = params[:other_amount].to_i
    end
    return amount
  end

  def donation_params
    params.require(:donation).permit(:amount, :email, :one_off, :regular, :member_id, :stripe_subscription_id, :active_regular_donation)
  end

end

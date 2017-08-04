class DonationsController < ApplicationController

  def new
  end

  def create
    # Amount in cents
    @amount = convert_to_pence(params[:amount])

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'gbp'
    )
    # insert flash notice on completion
    redirect_to root_path
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end


end

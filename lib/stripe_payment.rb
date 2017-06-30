class StripePayment

  def create_customer(member, params)
    # binding.pry
    Stripe::Customer.create(
      :email => member.email,
      :source  => params[:stripeToken]
    )
  end

  def create_charge(member, event, params)
    charge = Stripe::Charge.create(
      :customer    => member.id,
      :amount      => 500,
      :description => 'Rails Stripe customer',
      :currency    => 'gbp',
      :token       => params[:stripeToken]
    )
  end
end

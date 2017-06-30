class StripePayment

  def create_customer(member, token)
    customer = Stripe::Customer.create(
      :email => member.email,
      :source => token
    )
  end

  def create_charge(customer)
    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => 1000,
      :currency => "gbp",
      :description => "Example charge"
    )
  end
end

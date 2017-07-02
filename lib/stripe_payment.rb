class StripePayment

  def create_customer(member, token)
    customer = Stripe::Customer.create(
      :email => member.email,
      :source => token
    )
  end

  def create_charge(customer, event)
    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => event.price_in_pence,
      :currency => "gbp",
      :description => event.name
    )
  end

  def subscribe (customer, membership)
    Stripe::Subscription.create(
      :customer => customer.id,
      :plan => membership.membership_type,
    )
  end
end

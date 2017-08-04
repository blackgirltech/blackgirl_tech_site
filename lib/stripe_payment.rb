class StripePayment

  def create_customer(member)
    Stripe::Customer.create(
      email: member.email,
      source: member.stripe_token
    )
  end

  def create_charge(customer_id, event)
    charge = Stripe::Charge.create(
      :customer => customer_id,
      :amount => event.price_in_pence,
      :currency => "gbp",
      :description => event.name
    )
  end

  def subscribe (customer_id, membership)
    Stripe::Subscription.create(
      :customer => customer_id,
      :plan => membership.membership_type,
    )
  end
end

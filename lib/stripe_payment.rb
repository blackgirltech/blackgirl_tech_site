class StripePayment

  def create_customer(member)
    Stripe::Customer.create(
      email: member.email,
      source: member.stripe_source
    )
  end

  def create_charge(customer_id, event, rsvp_refund)
    charge = Stripe::Charge.create(
      :customer => customer_id,
      :amount => event.price_in_pence,
      :currency => "gbp",
      :description => "name: #{event.name}, refund: #{rsvp_refund}"
    )
  end

  def subscribe (customer_id, membership)
    Stripe::Subscription.create(
      :customer => customer_id,
      :plan => membership.membership_type,
    )
  end
end

class StripePayment

  def create_customer(member)
    Stripe::Customer.create(
      email: member.email,
      source: member.stripe_source
    )
  end

  def create_charge(customer_id, event, *rsvp_donate)
    charge = Stripe::Charge.create(
      :customer => customer_id,
      :amount => event.price_in_pence,
      :currency => "gbp",
      :description => "name: #{event.name}, donate: #{rsvp_donate}"
    )
  end

  def create_plan(amount, product_name)
    Stripe::Plan.create({
    product: {
      name: product_name,
    },
      currency: 'gbp',
      interval: 'month',
      amount: amount,
    })
  end

  def subscribe(customer_id, plan)
    Stripe::Subscription.create(
      :customer => customer_id,
      # pass plan to below
      :plan => plan,
    )
  end
end

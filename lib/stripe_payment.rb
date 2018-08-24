class StripePayment

  def create_customer(email, stripe_source)
    Stripe::Customer.create(
      email: email,
      source: stripe_source
    )
  end

  def create_charge(price, stripe_source, charge_source, email)
    Stripe::Charge.create(
      :amount => price,
      :currency => "gbp",
      :description => "#{email}_#{charge_source}",
      :source => stripe_source,
    )
  end

  def create_customer_charge(customer_id, event, *rsvp_donate)
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

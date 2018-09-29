class CreateDonation
  attr_reader :client

  def initialize(client: nil)
    @client = client || StripePayment.new
  end

  def create_one_off_donation(amount, token, email)
    @client.create_charge(amount, token, "donation", email)
  end

  def create_regular_donation(member, stripe_source, donation, amount)
    if member.stripe_customer_id.nil? || member.stripe_source.nil?
      member.update(stripe_source: stripe_source)
      customer = @client.create_customer(member.email, stripe_source)
      member.update(stripe_customer_id: customer.id)
      regular_donation = @client.subscribe(customer.id, *plan)
    else
      product_name = donation.email + "_monthly"
      plan = @client.create_plan(amount, product_name)
      regular_donation = @client.subscribe(member.stripe_customer_id, plan)
    end
    donation.update(stripe_subscription_id: regular_donation.id, active_regular_donation: true)
  end

end

class CreateDonation
  attr_reader :client

  def initialize(client: nil)
    @client = client || StripePayment.new
  end

  def create_one_off_donation(token, amount)
    # Charge the user's card:
    donation = Stripe::Charge.create(
      :amount => amount,
      :currency => "gbp",
      :description => "one_off_donation",
      :source => token,
    )
  end

  def create_regular_donation(member, stripe_source, *plan)
    @client = StripePayment.new

    if member.stripe_customer_id.nil? || member.stripe_source.nil?
      member.update(stripe_source: stripe_source)
      customer = @client.create_customer(member)
      member.update(stripe_customer_id: customer.id)
      @client.subscribe(customer.id, *plan)
    else
      @client.subscribe(member.stripe_customer_id, *plan)
    end
  end

end

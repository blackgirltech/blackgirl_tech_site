class CreateMembership
  attr_reader :client

  def initialize(client: nil)
    @client = client || StripePayment.new
  end

  def create(member, membership, stripe_source)
    @client = StripePayment.new
    if member.stripe_customer_id.nil? || member.stripe_source.nil?
      member.update(stripe_source: stripe_source)
      customer = @client.create_customer(member)
      member.update(stripe_customer_id: customer.id)
      subscription = @client.subscribe(customer.id, membership)
    else
      subscription = @client.subscribe(member.stripe_customer_id, membership)
    end
    membership.update(stripe_subscription_id: subscription.id)
  end

end

class CreateMembership
  attr_reader :client

  def initialize(client: nil)
    @client = client || StripePayment.new
  end

  def create(member, membership)
    customer = @client.create_customer(member)
    subscription = @client.subscribe(customer.id, membership)
    membership.update(stripe_subscription_id: subscription.id)
  end

end

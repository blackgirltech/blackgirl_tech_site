class CreateMembership
  attr_reader :client

  def initialize(client: nil)
    @client = client || StripePayment.new
  end

  def create(member, membership)
    customer = @client.create_customer(member, membership.stripe_membership_token)
    @client.subscribe(customer, membership)
  end

end

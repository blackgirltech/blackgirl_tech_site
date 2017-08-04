class CreateMembership
  attr_reader :client

  def initialize(client: nil)
    @client = client || StripePayment.new
  end

  def create(member, membership, stripe_source)
    @client = StripePayment.new

    # Cancel base membership before creating paid membership
    if member.memberships.find_by_membership_type("BASE").cancellation_date.nil?
      old_membership = member.memberships.find_by_membership_type("BASE")
      old_membership.update!(cancellation_date: Time.now)
    end
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

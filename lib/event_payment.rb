class EventPayment
  attr_reader :client

  def initialize(client: nil)
    @client = client || StripePayment.new
  end

  def pay(member, event, rsvp, stripe_source)
    if member.nil?
      charge = @client.create_charge(event.price_in_pence, stripe_source)
    elsif member.stripe_customer_id.nil? || member.stripe_source.nil?
      member.update(stripe_source: stripe_source)
      customer = @client.create_customer(member)
      member.update(stripe_customer_id: customer.id)
      charge = @client.create_customer_charge(customer.id, event, rsvp.donate)
    else
      charge = @client.create_customer_charge(member.stripe_customer_id, event, rsvp.donate)
    end

    rsvp.update(stripe_charge_token: charge.id)
  end

end

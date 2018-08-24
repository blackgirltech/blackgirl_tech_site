class EventPayment
  attr_reader :client

  def initialize(client: nil)
    @client = client || StripePayment.new
  end

  def pay(member, rsvp, rsvp_params)
    if member.nil?
      customer = @client.create_customer(rsvp_params[:email], rsvp_params[:stripe_source])
      charge = @client.create_customer_charge(customer.id, rsvp.event, rsvp.donate)

    elsif member.stripe_customer_id.nil? || member.stripe_source.nil?
      member.update(stripe_source: rsvp_params[:stripe_source])
      customer = @client.create_customer(member.email, member.stripe_source)
      member.update(stripe_customer_id: customer.id)
      charge = @client.create_customer_charge(customer.id, rsvp.event, rsvp.donate)

    else
      charge = @client.create_customer_charge(member.stripe_customer_id, rsvp.event, rsvp.donate)
    end

    rsvp.update(stripe_charge_token: charge.id)
  end

end

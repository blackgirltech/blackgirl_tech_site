class EventPayment
  attr_reader :client

  def initialize(client: nil)
    @client = client || StripePayment.new
  end

  def pay(member, event, rsvp)
    if member.stripe_customer_id.nil?|| current_member.stripe_source.nil?
      member.update(stripe_source: params[:stripe_source])
      customer = @client.create_customer(member)
      member.update(stripe_customer_id: customer.id)
      charge = @client.create_charge(customer.id, event, rsvp.refund)
    else
      charge = @client.create_charge(member.stripe_customer_id, event, rsvp.refund)
    end
    rsvp.update(stripe_charge_token: charge.id)
  end

end

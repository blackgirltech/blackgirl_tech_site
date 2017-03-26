class CompleteSubscription
  attr_reader :client

  def initialize(client: nil)
    @client = client || GoCardlessSubscription.new
  end

  def complete(user, params)
    subscription = user.most_recent_subscription
    redirect_flow = client.complete_redirect_flow(params[:redirect_flow_id], params[:authenticity_token])
    subscription.update!(gc_mandate_id: redirect_flow.links.mandate, gc_customer_id: redirect_flow.links.customer)
    payment = client.subscription(subscription.gc_mandate_id, subscription.id)
    subscription.update!(gc_payment_id: payment.id)
    subscription
  end
end
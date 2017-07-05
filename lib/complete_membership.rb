class CompleteMembership
  attr_reader :client

  def initialize(client: nil)
    @client = client || GoCardlessMembership.new
  end

  def complete(member, params)
    membership = member.most_recent_membership
    redirect_flow = client.complete_redirect_flow(params[:redirect_flow_id], params[:authenticity_token])
    membership.update!(gc_mandate_id: redirect_flow.links.mandate, gc_customer_id: redirect_flow.links.customer)
    payment = client.membership(membership.gc_mandate_id, membership.id, member)
    membership.update!(gc_payment_id: payment.id)
    membership
  end
end
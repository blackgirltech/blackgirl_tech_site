class CancelMembership
  attr_reader :client

  def initialize(client: nil)
    @client = client || GoCardlessMembership.new
  end

  def cancel(member)
    membership = member.most_recent_membership
    client.cancel(membership.gc_payment_id)
    membership.update!(cancellation_date: Time.now)
  end
end
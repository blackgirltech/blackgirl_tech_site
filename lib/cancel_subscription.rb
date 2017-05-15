class CancelSubscription
  attr_reader :client

  def initialize(client: nil)
    @client = client || GoCardlessSubscription.new
  end

  def cancel(member)
    subscription = member.most_recent_subscription
    client.cancel(subscription.gc_payment_id)
    subscription.update!(cancellation_date: Time.now)
  end
end
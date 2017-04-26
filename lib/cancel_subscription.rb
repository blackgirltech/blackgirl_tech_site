class CancelSubscription
  attr_reader :client

  def initialize(client: nil)
    @client = client || GoCardlessSubscription.new
  end

  def cancel(user)
    subscription = user.most_recent_subscription
    client.cancel(subscription.gc_payment_id)
    subscription.update!(cancellation_date: Time.now)
    subscription = user.subscriptions.create!(subscription_type: "FREE", expiration_date: Date.today + 1.year)
  end
end
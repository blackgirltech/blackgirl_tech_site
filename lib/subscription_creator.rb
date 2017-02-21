class SubscriptionCreator
  attr_reader :client

  def initialize(client: nil)
    @client = client || GoCardlessSubscription.new
  end

  def create(user, params)
    subscription = user.subscriptions.create!(subscription_type: params[:subscription_type])
    response = client.redirect_flow(subscription.subscription_type, params[:authenticity_token], 'http://localhost5000/user/#{user.id}')
    response[:id]
    response[:redirect_url]
    return subscription
  end
end
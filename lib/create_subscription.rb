class CreateSubscription
  attr_reader :client

  def initialize(client: nil)
    @client = client || GoCardlessSubscription.new
  end

  def create(user, params)
    subscription = user.subscriptions.create!(subscription_type: params[:subscription_type], expiration_date: Date.today + 1.year)
    response = client.redirect_flow(subscription.subscription_type, params[:authenticity_token], "http://localhost:5000/users/#{user.id}")
    subscription.update!(redirect_url: response.redirect_url, response_id: response.id)
    subscription
  end
end
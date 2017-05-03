class CreateSubscription
  attr_reader :client

  def initialize(client: nil)
    @client = client || GoCardlessSubscription.new
  end

  def create(user, params)
    if params[:subscription_type] == "FREE"
      # subscription = user.subscriptions.create!(subscription_type: params[:subscription_type], expiration_date: Date.today + 1.year)
      FreeSubscription.create!(subscription_type: params[:subscription_type], user_id: user.id, expiration_date: Date.today + 1.year)
      return
    elsif params[:subscription_type] == "MEMBER"
      subscription = MemberSubscription.create!(subscription_type: params[:subscription_type], user_id: user.id, expiration_date: Date.today + 1.year)
      response = client.redirect_flow(subscription.subscription_type, params[:authenticity_token], params[:success_redirect_url])
      subscription.update!(redirect_url: response.redirect_url, response_id: response.id)
      subscription
    elsif params[:subscription_type] == "ALLY"
      subscription = AllySubscription.create!(subscription_type: params[:subscription_type], user_id: user.id, expiration_date: Date.today + 1.year)
      response = client.redirect_flow(subscription.subscription_type, params[:authenticity_token], params[:success_redirect_url])
      subscription.update!(redirect_url: response.redirect_url, response_id: response.id)
      subscription
    end
  end
end
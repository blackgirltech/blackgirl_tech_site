require 'gocardless_pro'

# - SubscriptionController#new
# - SubscriptionController#create #=> 
# - GoCardless - user completes GoCardless form
# - SubscriptionController#finish

# def create
#   @subscription = SubscriptionCreator.new.create(current_user, params)
#   redirect_to @subscription.redirect_url
# end

# def finish
#   SubscriptionFinisher.new.finish(current_user, params)
#   redirect_to profile_url(current_user) 
# end

class GoCardlessSubscription

  def client
    GoCardlessPro::Client.new(
      # We recommend storing your access token in an
      # environment variable for security, but you could 
      # include it as a string directly in your code
      access_token: "sandbox_HzkdgfI8haEGsRQlNfOBAgZ4MEWZZWRzUDR138k_",
      # ENV["GO_CARDLESS_SANDBOX"],
      # Remove the following line when you're ready to go live
      environment: :sandbox
    )
  end

  def redirect_flow(desc, session_token, success_redirect_url)
    client.redirect_flows.create(
      params: {
        description: "#{desc}",
        session_token: "#{session_token}",
        success_redirect_url: "#{success_redirect_url}"
      }
    )
  end

  def complete_redirect_flow(redirect_id, session_token)
    client.redirect_flows.complete(
      "#{redirect_id}", # The redirect flow ID from above.
      params: { session_token: "#{session_token}" }
    )
  end

  def subscription(mandate_id, subscription_id)
    client.subscriptions.create(
      params: {
        amount: 1500, # 15 GBP in pence
        currency: 'GBP',
        interval_unit: 'monthly',
        day_of_month: '5',
        links: {
          mandate: "#{mandate_id}" # Mandate ID from the last section
        },
        metadata: {
          subscription_id: "#{subscription_id}"
        }
      },
      headers: {
        'Idempotency-Key': 'random_subscription_specific_string'
      }
    )
  end
end
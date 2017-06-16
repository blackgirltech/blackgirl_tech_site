require 'gocardless_pro'

# - membershipController#new
# - SubscriptionController#create #=>
# - GoCardless - user completes GoCardless form
# - SubscriptionController#finish

class GoCardlessMembership

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
        description: desc,
        session_token: session_token,
        success_redirect_url: success_redirect_url
      }
      # prefilled_customer: { # Optionally, prefill customer details on the payment page
      #   given_name: user.first_name,
      #   family_name: user.last_name,
      #   email: user.email,
      #   address_line1: user.address_line_one,
      #   city: user.city,
      #   postal_code: user.postcode
      # }
    )
  end

  def complete_redirect_flow(redirect_id, session_token)
    client.redirect_flows.complete(
      redirect_id,
      params: { session_token: session_token }
    )
  end

  def membership(mandate_id, membership_id, current_member)
    client.memberships.create(
      params: {
        amount: 500,
        currency: 'GBP',
        interval_unit: 'monthly',
        links: {
          mandate: "#{mandate_id}"
        },
        metadata: {
          membership_id: "#{membership_id}"
        }
      },
      headers: {
        'Idempotency-Key': "#{mandate_id}"
      }
    )
  end

  def cancel(gc_mandate)
    client.memberships.cancel(gc_mandate)
  end
end

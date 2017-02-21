describe SubscriptionCreator do
  context "when initialising creator" do
    let (:creator) { SubscriptionCreator.new }
    it "should create new client if one doesn't exist" do
      expect(creator.client).to_not be_nil
    end
  end

  context "when createing subscription" do
    let (:creator) { SubscriptionCreator.new(client: FakeSubscription.new) }

    it "should" do
      user = double("user")
      subscriptions = double("subscriptions")
      free = double("subscription")
      allow(user).to receive(:subscriptions) { subscriptions }
      allow(subscriptions).to receive(:create!) { free }
      allow(free).to receive(:subscription_type) { "free" }
      
      creator.create(user, {})
    end
  end
end

class FakeSubscription
  def redirect_flow(desc, session_token, success_redirect_url)
  end
end
describe CreateSubscription do
  context "when initialising creator" do
    let (:creator) { CreateSubscription.new }
    it "should create new client if one doesn't exist" do
      expect(creator.client).to_not be_nil
    end
  end

  context "when creating subscription" do
    let (:creator) { CreateSubscription.new(client: FakeSubscription.new) }
    let (:user) { create :user }
    before { create :membership_subscription, user: user }

    it "should set response_id on subscription" do
      subscription = creator.create(user, {})
      expect(subscription.response_id).to_not be_nil
    end
  end
end

class FakeSubscription
  def redirect_flow(desc, session_token, success_redirect_url)
    Struct.new(:id, :redirect_url).new(1, "redirect.url")
  end
end
describe CompleteSubscription do
  context "when initialising complete_subscription" do
    let (:complete_subscription) { CompleteSubscription.new }
    it "should create new client if one doesn't exist" do
      expect(complete_subscription.client).to_not be_nil
    end
  end

  context "when completing a subscription" do
    let (:complete_subscription) { CompleteSubscription.new(client: FakeCompleteSubscription.new) }
    let (:user) { create :user }
    before { create :membership_subscription, user: user }

    it "should set gc_mandate_id && gc_customer_id" do
      subscription = complete_subscription.complete(user, {redirect_flow_id: "JDFJDBVJNKDFJN"})
      expect(subscription.gc_mandate_id).to_not be_nil
      expect(subscription.gc_customer_id).to_not be_nil
    end

    it "should" do
      subscription = complete_subscription.complete(user, {redirect_flow_id: "JDFJDBVJNKDFJN"})
      expect(subscription.gc_payment_id).to_not be_nil
    end
  end
end

class FakeCompleteSubscription
  def complete_redirect_flow(redirect_id, session_token)
   links = Struct.new(:mandate, :customer).new("test_mandate_id", "test_customer_id")
   redirect_flow = Struct.new(:links).new(links)
  end

  def subscription(mandate_id, subscription_id)
    payment = Struct.new(:id).new(1)
  end
end
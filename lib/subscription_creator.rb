class SubscriptionCreator
  attr_reader :client

  def initialize(client: nil)
    @client = client || GoCardlessSubscription.new
  end
end
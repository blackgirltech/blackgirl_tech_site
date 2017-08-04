class UpdateMembership

  def upgrade(membership, membership_type)
    subscription = Stripe::Subscription.retrieve(membership.stripe_subscription_id)
    item_id = subscription.items.data[0].id
    items = [{
      id: item_id,
      plan: membership_type,
    }]
    s.items = items
    subscription.save
  end
end

class CancelMembership

  def cancel(membership_id, member)
    @membership = Membership.find_by_id(membership_id)
    if subscription = Stripe::Subscription.retrieve(@membership.stripe_subscription_id)
      subscription.delete(:at_period_end => true)
    end
  end

end

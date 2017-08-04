class CancelMembership

  def cancel(membership_id, member)
    @membership = Membership.find_by_id(membership_id)
    if subscription = Stripe::Subscription.retrieve(@membership.stripe_subscription_id)
      subscription.delete(:at_period_end => true)
    end
    @membership.update(cancellation_date: Date.today)
    BaseMembership.create!(membership_type: "BASE", expiration_date: Time.now + 1.year, member_id: member.id)
  end

end

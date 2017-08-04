class CancelMembership

  def cancel
    @membership = Membership.find_by_id(params[:membership_id])
    if subscription = Stripe::Subscription.retrieve(@membership.stripe_subscription_id)
      subscription.delete(:at_period_end => true)
    end
    @membership.update(cancellation_date: Date.today)
  end

end

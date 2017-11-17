class CancelRegularDonation

  def cancel(donation_id, member)
    @donation = Donation.find_by_id(donation_id)
    if subscription = Stripe::Subscription.retrieve(@donation.stripe_subscription_id)
      subscription.delete(:at_period_end => true)
    end
  end

end

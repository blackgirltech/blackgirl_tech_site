class RefundPayment

  def refund(rsvp)
    Stripe::Refund.create(
      :charge => rsvp.stripe_charge_token,
      :amount => rsvp.event.price_in_pence,
    )
  end
end

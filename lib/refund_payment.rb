class RefundPayment

  def refund(rsvp_charge_token, event_price)
    Stripe::Refund.create(
      :charge => rsvp_charge_token,
      :amount => event_price,
    )
  end
end

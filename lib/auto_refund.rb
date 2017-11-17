class AutoRefund
  def refund(event_id)
    Rsvp.where(checked_in: true, donate: false, event_id: event_id).map do |rsvp|
      RefundPayment.new.refund(rsvp)
    end
  end
end

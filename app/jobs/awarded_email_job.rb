class AutoRefundJob < ApplicationJob
  def perform(event_id)
    AutoRefund.new.refund(event_id)
  end
end

class Subscription < ApplicationRecord
  belongs_to :member

  validates :member, presence: true

  def free?
    self.subscription_type == "FREE"
  end

  def ally?
    self.subscription_type == "ALLY"
    self.gc_payment_id.present?
  end

  def membership?
    self.subscription_type == "MEMBERSHIP"
    self.gc_payment_id.present?
  end

  def paid?
    ally? || membership?
  end

end

class FreeSubscription < Subscription
  protokoll :subscription_number, :pattern => "C######"
end

class MemberSubscription < Subscription
  protokoll :subscription_number, :pattern => "A######"
end

class AllySubscription < Subscription
  protokoll :subscription_number, :pattern => "B######"
end

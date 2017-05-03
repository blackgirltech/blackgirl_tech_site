class Subscription < ApplicationRecord
  belongs_to :user

  # validates :user, presence: true
  # validate :prevent_duplicates

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

  
  private

  def prevent_duplicates
    if user.active_subscription?
      errors.add(:user, "already has an active subscription")
    end
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

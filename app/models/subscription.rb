class Subscription < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validate :prevent_duplicates

  def free?
    self.subscription_type == "free"
  end

  def ally?
    self.subscription_type == "ally"
  end

  def membership?
    self.subscription_type == "membership"
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

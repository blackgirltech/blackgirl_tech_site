class Subscription < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validate :prevent_duplicates

  
  private

  def prevent_duplicates
    if user.active_subscription?
      errors.add(:user, "already has an active subscription")
    end
  end
end

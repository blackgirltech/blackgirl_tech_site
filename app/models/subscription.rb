class Subscription < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  # validate :prevent_duplicates

  # before_validation :set_expiration_date

  private

  # def set_expiration_date
  #   self.update_attribute(:expiration_date, Date.today + 1.year)
  # end

  # def prevent_duplicates
  #   if user.active_subscription?
  #     errors.add(:user, "already has an active subscription")
  #   end
  # end
end

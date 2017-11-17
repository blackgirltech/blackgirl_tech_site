class Donation < ApplicationRecord
  validates_presence_of :email, :amount

  belongs_to :member

# Allow donations to be cancelled
  # def self.cancel_membership
  #   cancelled_memberships = where(expiration_date: Time.now).where.not(cancellation_date: nil)
  #   cancelled_memberships.each do |m|
  #     # make sure stripe isn't collecting money after the expiration_date
  #     # this needs to be a job to check when to stop collecting money
  #   end
  # end

end

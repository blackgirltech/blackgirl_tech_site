class Membership < ApplicationRecord
  belongs_to :member

  validates :member, presence: true

  def base?
    self.membership_type == "BASE"
  end

  def ally?
    self.membership_type == "ALLY"
    self.gc_payment_id.present?
  end

  def club?
    self.membership_type == "CLUB"
    self.gc_payment_id.present?
  end

  def paid?
    ally? || club?
  end

  def is_expired?
    self.expiration_date == Time.now && self.cancellation_date.present?
  end

  def self.rollover_expiration_date
    expired_memberships = where(expiration_date: Time.now)
    expired_memberships.each { |m| m.update(expiration_date: Time.now + 1.year) }
  end

  def self.cancel_membership
    cancelled_memberships = where(expiration_date: Time.now).where.not(cancellation_date: nil)
    cancelled_memberships.each do |m|
      # make sure stripe isn't collecting money after the expiration_date
      # this needs to be a job to check when to stop collecting money
    end
  end

end

class BaseMembership < Membership
  protokoll :membership_number, :pattern => "A###"
end

class ClubMembership < Membership
  protokoll :membership_number, :pattern => "B###"
end

class AllyMembership < Membership
  protokoll :membership_number, :pattern => "C###"
end

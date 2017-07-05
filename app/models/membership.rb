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
    self.expiration_date == Date.today && self.cancellation_date.present?
  end

  def set_new_expiration_date
    if !self.is_expired?
      self.update(expiration_date: Date.tody + 1.year)
    end
  handle_asynchronously :set_new_expiration_date

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

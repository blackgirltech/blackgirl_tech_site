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

end

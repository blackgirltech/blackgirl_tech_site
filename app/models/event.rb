class Event < ApplicationRecord

  has_many :members, through: :rsvp

  def finished
    self.date.present? && (self.date < Date.today)
  end

  def inactive
    self.date.month != Date.today.month
  end

end
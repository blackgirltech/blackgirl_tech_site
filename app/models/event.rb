class Event < ApplicationRecord

  has_many :rsvps
  has_many :members, through: :rsvps
  has_many :event_venues
  has_many :venue, through: :event_venues

  def finished
    self.date.present? && (self.date < Date.today)
  end

  def inactive
    self.date.month != Date.today.month
  end

end

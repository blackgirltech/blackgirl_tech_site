class Event < ApplicationRecord

  has_many :rsvps
  has_many :members, through: :rsvps
  has_many :event_venues
  has_many :venue, through: :event_venues

  after_create :auto_refund

  def finished
    self.date.present? && (self.date < Date.today)
  end

  def inactive
    self.date.month != Date.today.month
  end

  def max_attendees?
    self.max_attendees.present? && self.rsvps.where(attending: true).count >= self.max_attendees
  end

  def max_volunteers?
    self.max_volunteers.present? && self.rsvps.where(volunteering: true).count >= self.max_volunteers
  end

  private
  def auto_refund
    # Change the date to seconds
    AutoRefundJob.set(wait: self.date.to_datetime.to_i + 1.day).perform_later(self.id)
  end

end

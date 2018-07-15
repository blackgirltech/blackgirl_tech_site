class Event < ApplicationRecord
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_many :rsvps
  has_many :members, through: :rsvps
  has_many :event_venues
  has_many :venue, through: :event_venues

  # after_create :auto_refund, :send_event_email

  # def address
  #   if self.venue.first
  #     self.venue.first.address
  #   else
  #     address
  #   end
  # end

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

  def price
    (self.price_in_pence.to_f/100).round(2)
  end

  def self.upcoming
    where("date >= ?", Date.today).order(date: :asc)
  end

  private
  def auto_refund
    AutoRefundJob.set(wait_until: self.date.to_datetime + 1.day).perform_later(self.id)
  end

  def send_event_email
    EventEmailJob.set(wait_until: self.date.to_datetime - 10.day).perform_later(self)
  end

end

class Rsvp < ApplicationRecord
  belongs_to :event
  belongs_to :member

  validates_presence_of :event, :member
end

class EventVenue < ApplicationRecord
  belongs_to :event
  belongs_to :venue
end

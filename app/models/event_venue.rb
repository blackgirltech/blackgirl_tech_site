class EventVenue < ApplicationRecord
  belongs_to :event, optional: true
  belongs_to :venue, optional: true
end

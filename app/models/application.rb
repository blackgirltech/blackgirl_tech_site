class Application < ApplicationRecord
  belongs_to :member
  belongs_to :opportunity, optional: true
  has_one_attached :cv
end

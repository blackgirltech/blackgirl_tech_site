class Application < ApplicationRecord
  belongs_to :member
  belongs_to :opportunity, optional: true
end

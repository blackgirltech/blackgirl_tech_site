class Donation < ApplicationRecord
  validates_presence_of :email, :amount

  belongs_to :member
end

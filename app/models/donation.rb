class Donation < ApplicationRecord
  validates_presence_of :email, :amount

end

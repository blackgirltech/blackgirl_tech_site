class Event < ApplicationRecord

  def finished
    self.date.present? && (self.date < Date.today)
  end

end
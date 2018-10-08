class Opportunity < ApplicationRecord
  has_many :applications


  def dispatch_live_email
    return unless live && !sent_email

    update(sent_email: true)
    OpportunityEmailJob.perform_later(self)
  end
end

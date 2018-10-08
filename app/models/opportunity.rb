class Opportunity < ApplicationRecord
  has_many :applications


  def dispatch_live_email
    return unless live && !sent_email

    OpportunityEmailJob.perform_later(self)
    update(sent_email: true)
  end
end

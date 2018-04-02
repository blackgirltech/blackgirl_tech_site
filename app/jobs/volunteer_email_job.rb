class VolunteerEmailJob < ApplicationJob
  def perform(event)
    AutoSendVolunteerEmail.send(event)
  end
end

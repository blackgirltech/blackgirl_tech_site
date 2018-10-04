class AwardedEmailJob < ApplicationJob
  def perform(member)
    SendAwardedApplicationEmail.send_email(member)
  end
end

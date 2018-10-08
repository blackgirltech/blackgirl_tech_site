class AwardedEmailJob < ApplicationJob
  def perform(member, opportunity_name)
    SendAwardedApplicationEmail.send_email(member, opportunity_name)
  end
end

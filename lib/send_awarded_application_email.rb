class SendAwardedApplicationEmail
  def self.send_email(member, opportunity_name)
    ApplicationsMailer.delay.awarded_application(member, opportunity_name)
  end
end
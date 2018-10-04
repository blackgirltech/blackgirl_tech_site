class SendAwardedApplicationEmail
  def self.send_email(member)
    ApplicationsMailer.delay.awarded_application(member)
  end
end
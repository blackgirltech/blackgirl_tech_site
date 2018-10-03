class SendAwardedApplicationEmail
  def self.send_email(application)
    ApplicationsMailer.delay.awarded_application(member)
  end
end
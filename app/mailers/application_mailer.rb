class ApplicationMailer < ActionMailer::Base
  default to: Proc.new { Member.where(subscribed_to_email: true).each.pluck(:email) },
    from: 'info@blackgirl.tech'
  layout 'mailer'

  def send_email(to, subject, text)
    RestClient.post "apikey"\
    "@api.mailgun.net/v3/mail.blackgirl.tech/messages",
    from: "blackgirl.tech <info@blackgirl.tech>",
    to: to,
    subject: subject,
    text: text
  end
end

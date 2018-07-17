class ApplicationMailer < ActionMailer::Base
  default to: Proc.new { Member.where(subscribed_to_email: true).each.pluck(:email) },
    from: 'blackgirl.tech@gmail.com'
  layout 'mailer'

end

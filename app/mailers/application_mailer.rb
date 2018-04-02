class ApplicationMailer < ActionMailer::Base
  default to: Proc.new { Member.where(subscribed_to_email: true).each.pluck(:email) },
    from: 'info@blackgirl.tech'
  layout 'mailer'
end

class ApplicationMailer < ActionMailer::Base
  default to: Proc.new { Member.where(contact_permission: true).each.pluck(:email) },
    from: 'blackgirl.tech@gmail.com'
  layout 'mailer'

end

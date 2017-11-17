class UpdateExpirationMailer < ApplicationMailer
  default from: 'from@example.com'
  layout 'mailer'

  def reminder(membership)
    to(membership.member.eamil)
  end
end

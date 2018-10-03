class ApplicationsMailer < ApplicationMailer
  default to: Proc.new { Member.where(subscribed_to_email: true).each.pluck(:email) }

  def awarded_application(member)
    @member = member
    mail(to: @member.email, subject: "Congratulations!")
  end
end

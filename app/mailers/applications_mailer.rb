class ApplicationsMailer < ApplicationMailer
  default to: Proc.new { Member.where(subscribed_to_email: true).each.pluck(:email) }

  def awarded_application(member, opportunity_name)
    @member = member
    @opportunity = opportunity_name
    @member.first_name.present? ? (@first_name = @member.first_name) : (@first_name = "Member")
    mail(to: @member.email, subject: "Congratulations #{@first_name}!")
  end
end
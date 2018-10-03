class ApplicationsMailer < ApplicationMailer
  default to: Proc.new { Member.where(subscribed_to_email: true).each.pluck(:email) }

  def awarded_application(member)
    @member = member
    if @member.first_name.present?
      @first_name = @member.first_name
    else
      @first_name = "Member"
    end
    mail(to: @member.email, subject: "Congratulations #{@first_name}!")
  end
end

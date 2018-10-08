class OpportunityMailer < ApplicationMailer
  default to: Proc.new { Member.where(subscribed_to_email: true).each.pluck(:email) }

  def upcoming_opportunity_email(member, opportunity)
    @member = member
    @opportunity = opportunity
    mail(to: @member.email, subject: "blackgirl.tech presents #{@opportunity.name}")
  end
end

class EventMailer < ApplicationMailer
  default to: Proc.new { Member.where(contact_permission: true).each.pluck(:email) }

  def upcoming_event_email(member, event)
    @member = member
    @event = event
    mail(to: @member.email, subject: "Join blackgirl.tech for #{@event.name}")
  end
end

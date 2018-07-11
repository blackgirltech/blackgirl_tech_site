class EventMailer < ApplicationMailer
  default to: Proc.new { Member.where(subscribed_to_email: true).each.pluck(:email) }

  def upcoming_event_email(member, event)
    @member = member
    @event = event

    # mail(to: @member.email, subject: "Join blackgirl.tech for #{@event.name}")
    send_email(@member.email, "Join blackgirl.tech for #{@event.name}", text)
  end
end

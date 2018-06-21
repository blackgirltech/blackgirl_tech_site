class VolunteerMailer < ApplicationMailer
  default to: Proc.new { Member.where(subscribed_to_email: true).where(volunteer: true).each.pluck(:email) }
  
  def upcoming_event_email(member, event)
    @member = member
    @event = event
    mail(to: @member.email, subject: "Volunteer for blackgirl.tech's #{@event.name}")
  end
end

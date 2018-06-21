class AutoSendVolunteerEmail
  def send(event)
    Member.where(volunteer: true, subscribed_to_email: true).map do |member|
      VolunteerMailer.delay.upcoming_event_email(member, event)
    end
  end
end

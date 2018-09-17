class AutoSendEventEmail
  def self.send_email(event)
    Member.where(subscribed_to_email: true).map do |member|
      EventMailer.delay.upcoming_event_email(member, event)
    end
  end
end

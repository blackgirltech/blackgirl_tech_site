class EventEmailJob < ApplicationJob
  def perform(event)
    AutoSendEventEmail.send_email(event)
  end
end

class EventEmailJob < ApplicationJob
  def perform(event)
    AutoSendEventEmail.send(event)
  end
end

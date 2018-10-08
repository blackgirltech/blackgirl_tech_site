class OpportunityEmailJob < ApplicationJob
  def perform(opportunity)
    AutoSendOpportunityEmail.send_email(opportunity)
  end
end

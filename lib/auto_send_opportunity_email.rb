class AutoSendOpportunityEmail
  def self.send_email(opportunity)
    Member.where(subscribed_to_email: true).map do |member|
      OpportunityMailer.delay.upcoming_opportunity_email(member, opportunity)
    end
  end
end

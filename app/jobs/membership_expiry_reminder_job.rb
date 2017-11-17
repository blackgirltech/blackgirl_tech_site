class MembershipExpiryReminderJob < ApplicationJob
  def perform(membership_id)
    SendMembershipReminder.new.send(membership_id)
  end
end

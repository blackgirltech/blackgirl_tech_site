class SendMembershipReminder
  def send(membership_id)
    m = Membership.find_by_id(membership_id)
    UpdateExpirationMailer.reminder(m)
  end
end

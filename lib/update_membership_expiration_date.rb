class UpdateMembershipExpirationDate
  def update(membership_id)
    m = Membership.find(membership_id)
    m.update(expiration_date: Time.now + 1.year)
    enqueue_expiry_update_job(m)
  end

  private
  def enqueue_expiry_update_job(membership)
    MembershipExpiryUpdateJob.set(wait_until: membership.expiration_date.to_datetime).perform_later(membership.id)
  end
end

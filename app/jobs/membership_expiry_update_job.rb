class MembershipExpiryUpdateJob < ApplicationJob
  def perform(membership_id)
    UpdateMembershipExpirationDate.new.update(membership_id)
  end
end

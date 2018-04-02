module ApplicationHelper
  def admin?
    current_member && current_member.admin?
  end

  def volunteer?
    current_member && current_member.volunteer?
  end

  def active_regular_donor
    current_member.donations.last && current_member.donations.last.active_regular_donation
  end
end

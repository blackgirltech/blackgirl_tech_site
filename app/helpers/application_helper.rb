module ApplicationHelper
  def admin?
    current_user && current_user.admin?
  end

  def volunteer?
    current_user && current_user.volunteer?
  end
end

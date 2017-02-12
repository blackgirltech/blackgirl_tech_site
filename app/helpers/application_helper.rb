module ApplicationHelper
  def admin?
    if current_user && current_user.admin?
      true
    else
      false
    end
  end

  def volunteer?
    if current_user && current_user.volunteer?
      true
    else
      false
    end
  end
end

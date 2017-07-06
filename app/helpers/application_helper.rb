module ApplicationHelper
  def admin?
    current_member && current_member.admin?
  end

  def volunteer?
    current_member && current_member.volunteer?
  end

  def convert_to_pence(number)
    number * 100
  end
end

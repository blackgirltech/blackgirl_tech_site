class Application < ApplicationRecord
  belongs_to :member
  belongs_to :opportunity, optional: true
  has_one_attached :cv

  def dispatch_awarded_email
    return unless awarded && !awarded_email_sent

    AwardedEmailJob.perform_later(member, opportunity.name)
    update(awarded_email_sent: true)
  end
end

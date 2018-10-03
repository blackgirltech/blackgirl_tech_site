class AddAwardedEmailSentToApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :awarded_email_sent, :boolean, default:false
  end
end

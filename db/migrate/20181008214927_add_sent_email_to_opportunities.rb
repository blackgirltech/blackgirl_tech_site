class AddSentEmailToOpportunities < ActiveRecord::Migration[5.2]
  def change
    add_column :opportunities, :sent_email, :boolean, default: false
  end
end

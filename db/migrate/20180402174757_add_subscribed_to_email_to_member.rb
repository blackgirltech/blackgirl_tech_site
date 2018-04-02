class AddSubscribedToEmailToMember < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :subscribed_to_email, :boolean, default: true
  end
end

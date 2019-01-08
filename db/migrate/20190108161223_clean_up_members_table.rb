class CleanUpMembersTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :address_line_one, :string
    remove_column :members, :address_line_two, :string
    remove_column :members, :city, :string
    remove_column :members, :postcode, :string
    remove_column :members, :tutor, :boolean
    remove_column :members, :subscribed_to_email, :boolean
    remove_column :members, :invitation_token, :string
    remove_column :members, :invitation_accepted_at, :datetime
    remove_column :members, :invitation_created_at, :datetime
    remove_column :members, :invitation_sent_at, :datetime
    remove_column :members, :invitation_limit, :integer
    remove_column :members, :invitations_count, :integer
    remove_column :members, :invited_by_id, :integer
    remove_column :members, :invited_by_type, :string
  end
end

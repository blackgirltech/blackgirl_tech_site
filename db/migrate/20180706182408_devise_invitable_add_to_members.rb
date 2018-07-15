class DeviseInvitableAddToMembers < ActiveRecord::Migration[5.0]
  def change
      add_column :members, :invitation_token, :string
      add_column :members, :invitation_created_at, :datetime
      add_column :members, :invitation_sent_at, :datetime
      add_column :members, :invitation_accepted_at, :datetime
      add_column :members, :invitation_limit, :integer
      add_reference :members, :invited_by, polymorphic: true
      add_column :members, :invitations_count, :integer, default: 0
      add_index :members, :invitations_count
      add_index :members, :invitation_token, unique: true # for invitable
      add_index :members, :invited_by_id

      # Allow null encrypted_password
      change_column_null :members, :encrypted_password, :string, true
  end
end

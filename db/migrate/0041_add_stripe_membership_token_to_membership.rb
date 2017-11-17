class AddStripeMembershipTokenToMembership < ActiveRecord::Migration[5.0]
  def change
    add_column :memberships, :stripe_membership_token, :string
  end
end

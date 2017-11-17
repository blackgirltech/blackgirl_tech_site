class RenameStripeTokenColumninMembers < ActiveRecord::Migration[5.0]
  def change
    rename_column :members, :stripe_token, :stripe_source
  end
end

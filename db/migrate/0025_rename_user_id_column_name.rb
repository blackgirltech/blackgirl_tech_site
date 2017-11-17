class RenameUserIdColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :subscriptions, :user_id, :member_id
  end
end

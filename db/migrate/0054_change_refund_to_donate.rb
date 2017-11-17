class ChangeRefundToDonate < ActiveRecord::Migration[5.0]
  def change
    remove_column :rsvps, :refund, :boolean
    add_column :rsvps, :donate, :boolean, default: false
  end
end

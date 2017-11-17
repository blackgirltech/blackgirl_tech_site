class AddCancelationDateToSubscriptions < ActiveRecord::Migration[5.0]
  def change
    add_column :subscriptions, :cancellation_date, :datetime
  end
end

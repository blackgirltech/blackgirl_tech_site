class AddResponseFieldsToSubscription < ActiveRecord::Migration[5.0]
  def change
    add_column :subscriptions, :redirect_url, :string
    add_column :subscriptions, :response_id, :string
  end
end

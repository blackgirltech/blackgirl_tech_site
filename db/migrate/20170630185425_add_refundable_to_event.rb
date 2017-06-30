class AddRefundableToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :refundable, :boolean
  end
end

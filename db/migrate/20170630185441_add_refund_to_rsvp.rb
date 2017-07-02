class AddRefundToRsvp < ActiveRecord::Migration[5.0]
  def change
    add_column :rsvps, :refund, :boolean
  end
end

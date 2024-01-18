class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :session_id
      t.string :stripe_checkout_id
      t.string :status, default: 0

      t.timestamps
    end
  end
end

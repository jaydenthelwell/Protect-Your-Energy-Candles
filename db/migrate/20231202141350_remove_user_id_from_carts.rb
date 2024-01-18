class RemoveUserIdFromCarts < ActiveRecord::Migration[6.0]
  def change
    remove_column :carts, :user_id, :integer
  end
end

class AddPrimaryToAddresses < ActiveRecord::Migration[7.0]
  def change
    add_column :addresses, :primary, :boolean, default: false
  end
end

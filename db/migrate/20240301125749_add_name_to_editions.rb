class AddNameToEditions < ActiveRecord::Migration[7.0]
  def change
    add_column :editions, :name, :string
  end
end

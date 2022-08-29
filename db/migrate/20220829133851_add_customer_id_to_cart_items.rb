class AddCustomerIdToCartItems < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_items, :customer_id, :integer, null: false
  end
end

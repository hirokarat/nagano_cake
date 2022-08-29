class AddItemIdToCartItems < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_items, :item_id, :integer, null: false
  end
end
